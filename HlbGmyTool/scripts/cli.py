# This file is part of HemeLB and is Copyright (C)
# the HemeLB team and/or their institutions, as detailed in the
# file AUTHORS. This software is provided under the terms of the
# license in the file LICENSE.

from argparse import ArgumentParser

# Parse command line arguments
parser = ArgumentParser(
    description="Generate the config file " "described by a profile file"
)

parser.add_argument(
    "profile",
    nargs=1,
    help="The profile to "
    "use. Other options given override those in the "
    "profile file.",
    metavar="PATH",
)

parser.add_argument(
    "--stl",
    default=None,
    dest="StlFile",
    help="The STL file to use as input",
    metavar="PATH",
)
parser.add_argument(
    "--geometry",
    default=None,
    dest="OutputGeometryFile",
    help="Config output file",
    metavar="PATH",
)
parser.add_argument(
    "--xml", default=None, dest="OutputXmlFile", help="XML output file", metavar="PATH"
)
parser.add_argument(
    "--voxel",
    default=None,
    type=float,
    dest="VoxelSizeMetres",
    help="The voxel size in metres",
    metavar="FLOAT",
)


def main():
    # Parse
    args = parser.parse_args()
    # Separate the profile argument (argparse puts it in a list)
    profile = args.profile[0]
    del args.profile

    # Import our module late to give erroneous args a chance to be caught
    # quickly
    from ..Model.Profile import Profile

    p = Profile()
    p.LoadFromFile(profile)

    # override any keys that have been set on cmdline.
    p.UpdateAttributesBasedOnCmdLineArgs(vars(args))

    p.Generate()
