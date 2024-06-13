# This file is part of HemeLB and is Copyright (C)
# the HemeLB team and/or their institutions, as detailed in the
# file AUTHORS. This software is provided under the terms of the
# license in the file LICENSE.
import vtk
from .load import fixture_path


def write_stl(input, label):
    writer = vtk.vtkSTLWriter()
    writer.SetInputConnection(input.GetOutputPort())
    writer.SetFileTypeToBinary()
    writer.SetFileName(fixture_path(label))
    writer.Write()


def source_fixture(source, label):
    triangulator = vtk.vtkTriangleFilter()
    triangulator.SetInputConnection(source.GetOutputPort())
    # Make some polydata
    write_stl(triangulator, label)


def cube():
    source_fixture(vtk.vtkCubeSource(), "cube")


def cylinder():
    source = vtk.vtkCylinderSource()
    source.SetResolution(32)
    source_fixture(source, "cylinder")


if __name__ == "__main__":
    generate.cube()
    generate.cylinder()
