<!-- This file is part of HemeLB and is Copyright (C) -->
<!-- the HemeLB team and/or their institutions, as detailed in the -->
<!-- file AUTHORS. This software is provided under the terms of the -->
<!-- license in the file LICENSE. -->
# HemeLB geometry generation tool

This is the c++ code repository for the Faster Parallel Grid Generation project. 

**Vm** branch is used for development, because compiling in vm is faster than in cirrus and vm virtual machine is more accessible. 

**Cirrus** branch is used for profiling and benchmarking results.

After building the project following [Build HemelB geometry generation tool](https://git.ecdf.ed.ac.uk/msc-23-24/s2484724/-/blob/main/command.md), in *hemelb\geometry-tool\HlbGmyTool\Model\Generation* folder, 

run `git clone https://github.com/yyggs/Generation.git` 

to replace the HemelB geometry generation tool C++ code with the code in this repo.

Then run `git checkout Cirrus/vm` to switch to the corresponding branch (depend on the platform). 

run `./relwithdebinfo.sh` to rebuild the project. 
