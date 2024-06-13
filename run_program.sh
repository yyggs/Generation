#!/bin/bash

# Activate the Python environment

# source /home/lihua/miniconda3/etc/profile.d/conda.sh
# conda activate gmy-tool

# Run your commands
hlb-gmy-cli --xml ~/Desktop/hemelb-tests/diffTest/test/config.xml --geometry ~/Desktop/hemelb-tests/diffTest/test/config.gmy  --voxel 0.0001 ~/Desktop/hemelb-tests/diffTest/cyl.pr2 

