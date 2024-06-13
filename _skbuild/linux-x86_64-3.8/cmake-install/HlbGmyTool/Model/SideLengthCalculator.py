# This file is part of HemeLB and is Copyright (C)
# the HemeLB team and/or their institutions, as detailed in the
# file AUTHORS. This software is provided under the terms of the
# license in the file LICENSE.

from math import sqrt
from vtk import vtkProgrammableFilter, vtkPoints, vtkFloatArray, vtkPolyData


class AverageSideLengthCalculator(vtkProgrammableFilter):
    """Given an input vtkPolyData object, output a vtkPolyData with
    one point whose associated scalar is the average side length of
    the triangle contained within the input.

    Included is a convenience method GetOutputValue which will return
    a Python float of the answer.

    """

    def __init__(self):
        self.SetExecuteMethod(self.Execute)

    def Execute(self, *args):
        polydata = self.GetPolyDataInput()
        nTris = polydata.GetNumberOfCells()

        totalPerim = 0.0
        for i in range(nTris):
            tri = polydata.GetCell(i)
            perim = 0.0
            for j in range(3):
                perim += sqrt(tri.GetEdge(j).GetLength2())
                continue
            totalPerim += perim
            continue

        aveSide = totalPerim / (3 * nTris)

        p = vtkPoints()
        p.InsertPoint(0, 0.0, 0.0, 0.0)

        val = vtkFloatArray()
        val.InsertValue(0, aveSide)

        out = vtkPolyData()
        out.SetPoints(p)
        out.GetPointData().SetScalars(val)

        self.GetPolyDataOutput().ShallowCopy(out)
        return

    def GetOutputValue(self):
        self.Update()
        vals = self.GetOutput().GetPointData().GetScalars()
        if vals is None:
            return None
        return vals.GetValue(0)

    pass
