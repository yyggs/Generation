# This file is part of HemeLB and is Copyright (C)
# the HemeLB team and/or their institutions, as detailed in the
# file AUTHORS. This software is provided under the terms of the
# license in the file LICENSE.
import argparse


def main():
    p = argparse.ArgumentParser(
        description='Upgrade an saved profile from "config" to "geometry"'
    )
    p.add_argument("input")
    p.add_argument("output")
    args = p.parse_args()

    from ..Util.ProfileUpdateTools import Upgrade

    Upgrade(args.input, args.output)
