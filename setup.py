# This file is part of HemeLB and is Copyright (C)
# the HemeLB team and/or their institutions, as detailed in the
# file AUTHORS. This software is provided under the terms of the
# license in the file LICENSE.

import os
import sys

from skbuild import setup

build_type = os.getenv('BUILD_TYPE', 'Release')
#build_type = os.getenv('BUILD_TYPE', 'RelWithDebInfo')
# gmp_library_dir = os.getenv('GMP_LIBRARY_DIR', '/work/m23oc/m23oc/s2484724/gmp-6.3.0/install/lib')
# gmp_include_dir = os.getenv('GMP_INCLUDE_DIR', '/work/m23oc/m23oc/s2484724/gmp-6.3.0/install/include')
# mpfr_lib_dir = os.getenv('MPFR_LIBRARY_DIR', '/work/m23oc/m23oc/s2484724/mpfr-4.2.1/install/lib')
# mpfr_include_dir = os.getenv('MPFR_INCLUDE_DIR', '/work/m23oc/m23oc/s2484724/mpfr-4.2.1/install/include')

if sys.platform == "darwin":
    # Python thinks it's so smart and sets the
    # MACOSX_DEPLOYMENT_TARGET environment variable that messes around
    # with what features of the compiler and C++ std lib are
    # available. Set this to use your current one.
    import platform

    release, versioninfo, machine = platform.mac_ver()
    os.environ["MACOSX_DEPLOYMENT_TARGET"] = release

setup(
    name="HlbGmyTool",
    version="1.2",
    author="Rupert Nash",
    author_email="r.nash@epcc.ed.ac.uk",
    packages=[
        "HlbGmyTool",
        "HlbGmyTool.Bindings",
        "HlbGmyTool.Util",
        "HlbGmyTool.Model",
        "HlbGmyTool.View",
        "HlbGmyTool.Controller",
        "HlbGmyTool.scripts",
    ],
    cmake_args=[
        # f"-DMPFR_LIBRARIES={mpfr_lib_dir}",
        # f"-DMPFR_INCLUDE_DIR={mpfr_include_dir}",
        f"-DGMP_LIBRARIES='/work/m23oc/m23oc/s2484724/miniconda3/pkgs/vtk-9.1.0-egl_py38he163af0_15/lib'",
        f"-DGMP_INCLUDE_DIR='/work/m23oc/m23oc/s2484724/miniconda3/pkgs/vtk-9.1.0-egl_py38he163af0_15/include'",
        f"-DCMAKE_BUILD_TYPE={build_type}",
        #f"-DCMAKE_CXX_FLAGS='-g'",
    ],
    entry_points={
        "console_scripts": [
            "hlb-gmy-cli=HlbGmyTool.scripts.cli:main",
            "hlb-config2gmy=HlbGmyTool.scripts.config_to_geometry:main",
            "hlb-pro2pr2=HlbGmyTool.scripts.pro_to_pr2:main",
        ],
        "gui_scripts": [
            "hlb-gmy-gui=HlbGmyTool.scripts.gui:main[gui]",
        ],
    },
    python_requires=">=3.6",
    install_requires=[
        "pyyaml",
        # Numpy >= 1.20 requires python 3.7; VMTK conda binaries are 3.6 only
        "numpy < 1.20; python_version < '3.7'",
        "numpy; python_version >= '3.7'",
        "vtk ~= 9.0",
        "vmtk ~= 1.5",
    ],
    extras_require={
        "gui": ["wxPython"],
    },
)
