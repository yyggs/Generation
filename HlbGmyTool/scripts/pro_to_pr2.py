# This file is part of HemeLB and is Copyright (C)
# the HemeLB team and/or their institutions, as detailed in the
# file AUTHORS. This software is provided under the terms of the
# license in the file LICENSE.
from argparse import ArgumentParser
import os.path


def main():
    # Parse command line arguments
    parser = ArgumentParser(description="Upgrade an old setuptool profile file")

    parser.add_argument("old", help="The old profile file")
    parser.add_argument(
        "new",
        nargs="?",
        help="The new profile file (if absent, assumed to be basename(old) + .pr2)",
    )

    args = parser.parse_args()
    if args.new is None:
        base, ext = os.path.splitext(args.old)
        args.new = base + ".pr2"
        pass

    # Import our module late to give erroneous args a chance to be caught
    # quickly
    from ..Model.Profile import Profile

    p = Profile()
    p.LoadFromFile(args.old)
    p.Save(args.new)
