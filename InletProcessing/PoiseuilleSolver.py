# This file is part of HemeLB and is Copyright (C)
# the HemeLB team and/or their institutions, as detailed in the
# file AUTHORS. This software is provided under the terms of the
# license in the file LICENSE.

# import numpy as np
from scipy.sparse import lil_matrix
from vtk.util import numpy_support as convert
from vtk import vtkProgrammableFilter
import fipy
import fipy.tools.numerix as np
import numpy as np2
import sys


class PoiseuilleSolver(vtkProgrammableFilter):
    """Solve the boundary value problem, such that the volume flux (i.e.
    the integral of the velocity across the inlet surface) is one.
    """

    def __init__(self):
        self.SetExecuteMethod(self._Execute)

    def _Execute(self):
        input = self.GetPolyDataInput()

        self.mesh = FiPyTriangleMesher(input).GetMesh()

        self.speed = fipy.CellVariable(name="speed", mesh=self.mesh, value=0.0)
        self.speed.constrain(0.0, where=self.mesh.exteriorFaces)
        #        self.BCs = (fipy.FixedValue(faces=self.mesh.exteriorFaces, value=0),)

        self.equation = fipy.DiffusionTerm() + 1.0 == 0.0

        self.equation.solve(var=self.speed)  # , boundaryConditions=self.BCs)
        # FiPy API doesn't seem to have an integrate method
        # volumeFlux = self.speed.getCellVolumeAverage() * self.speed.mesh.getCellVolumes().sum()
        # Scale such that the flux will be unity
        # self.speed /= volumeFlux
        self.speed /= self.speed.mesh.getCellVolumes().sum()

        # print self.speed
        # print self.speed.getCellVolumeAverage(), self.speed.mesh.getCellVolumes().sum()

        output = self.GetPolyDataOutput()
        output.ShallowCopy(input)
        speed = convert.numpy_to_vtk(self.speed.getValue())
        output.GetCellData().SetScalars(speed)
        return

    pass


class FiPyTriangleMesher(object):
    """Create arrays describing the mesh suitable for FiPy."""

    def __init__(self, polyData):
        vertices3D = convert.vtk_to_numpy(polyData.GetPoints().GetData())
        # FiPy needs its coordinates in an array like:
        # [[x0, x1, ..., xn-1],
        #  [y0, y1, ..., yn-1]]
        # VTK gives us:
        # [[x0, y0, z0],
        #  [x1, y1, z1],
        #  ...,
        #  [xn-1, yn-1, zn-1]]
        self.vertices = vertices3D[:, 0:2].transpose()

        # VTK gives us a flat array of cells like
        # [nPoints, pId0, pId1, pId2, ... nPoints,... ]
        cells = convert.vtk_to_numpy(polyData.GetPolys().GetData())
        self.nTris = nTris = polyData.GetPolys().GetNumberOfCells()
        cells.shape = (nTris, 4)
        # So now cells[i] contains (3, id0, id1, id2) for triangle i

        # FiPy requires a list of the FACES (in 2D the lines) making up each
        # cell. Make the array the maximum possible size for now.
        self.faces = np.zeros((2, 3 * nTris), dtype=np2.int)

        # Since these have to be unique, construct a sparse lookup matrix
        # (a dictionary is very sloooooow)
        ############################################################
        # SUPER IMPORTANT- since the default value of the matrix is
        # zero, we're going to use 1-indexing for these so +1 when
        # writing and -1 when reading.
        ############################################################
        self.faceCache = lil_matrix((nTris, nTris), dtype=np2.int)
        # Track the number of faces added.
        self.nFaces = 0

        # A cell is defined by the IDs of its faces
        self.cells = np.zeros((3, nTris), dtype=np2.int)
        # Track the number added
        self.nCells = 0

        for triPtIds in cells[:, 1:]:
            for i in xrange(3):
                self.cells[i, self.nCells] = self._InsertUniqueFace(
                    triPtIds[i], triPtIds[(i + 1) % 3]
                )
                continue
            self.nCells += 1
            continue

        # Trim the unused face rows
        self.faces = self.faces[:, : self.nFaces]
        return

    def GetMesh(self):
        """Create and get the FiPy mesh."""
        np.set_printoptions(threshold=np.nan)
        #        print self.vertices
        #        print self.faces
        #        print self.cells
        return fipy.meshes.mesh2D.Mesh2D(self.vertices, self.faces, self.cells)

    # return fipy.meshes.numMesh.mesh2D.Mesh2D(self.vertices, self.faces, self.cells)

    def _InsertUniqueFace(self, a, b):
        """Get the Face ID of the face linking vertices with IDs a and b,
        creating the ID if it does not yet exist.
        """
        # Put them in ascending order
        if a > b:
            b, a = a, b

        faceId = self.faceCache[a, b] - 1
        if faceId < 0:
            # It has not been inserted, so insert a face
            faceId = self.nFaces
            self.nFaces += 1
            self.faceCache[a, b] = faceId + 1
            self.faces[0, faceId] = a
            self.faces[1, faceId] = b

        return faceId
