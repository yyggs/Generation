module load gcc/12.3.0-offload
module load cmake
module load ninja
module load boost
export BUILD_TYPE=RelWithDebInfo
export CGAL_DIR=/work/m23oc/m23oc/s2484724/CGAL-5.6.1/lib/cmake/CGAL
export VMTK_DIR="./vmtk"
export PATH="$VMTK_DIR/bin:$PATH"
export PYTHONPATH="$VMTK_DIR/lib/python3.8/site-packages:$PYTHONPATH"
pip install .