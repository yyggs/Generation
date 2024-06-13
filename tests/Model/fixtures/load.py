# This file is part of HemeLB and is Copyright (C)
# the HemeLB team and/or their institutions, as detailed in the
# file AUTHORS. This software is provided under the terms of the
# license in the file LICENSE.
import os
from HlbGmyTool.Model.Profile import Profile


def fixture_path(name):
    here = os.path.dirname(os.path.abspath(__file__))
    return os.path.join(here, name + ".stl")


def temporary_profile(tmpdir, name):
    result = Profile()
    basename = tmpdir.join(name).strpath
    outGmyFileName = basename + ".gmy"
    outXmlFileName = basename + ".xml"
    result.OutputGeometryFile = outGmyFileName
    result.OutputXmlFile = outXmlFileName
    return result


def file_fixture(tmpdir, label):
    # Create a profile which is a simple cube
    result = temporary_profile(tmpdir, label)
    result.StlFile = fixture_path(label)
    return result


def cube(tmpdir):
    return file_fixture(tmpdir, "cube")


def cylinder(tmpdir):
    return file_fixture(tmpdir, "cylinder")
