# Generated by CMake

if("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.8)
   message(FATAL_ERROR "CMake >= 2.8.0 required")
endif()
if(CMAKE_VERSION VERSION_LESS "2.8.3")
   message(FATAL_ERROR "CMake >= 2.8.3 required")
endif()
cmake_policy(PUSH)
cmake_policy(VERSION 2.8.3...3.23)
#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Protect against multiple inclusion, which would fail when already imported targets are added once more.
set(_cmake_targets_defined "")
set(_cmake_targets_not_defined "")
set(_cmake_expected_targets "")
foreach(_cmake_expected_target IN ITEMS itkdouble-conversion itksys itkvcl itkv3p_netlib itkvnl itkvnl_algo itktestlib ITKVNLInstantiation ITKCommon itkNetlibSlatec ITKStatistics ITKTransform ITKMesh itkzlib ITKMetaIO ITKSpatialObjects ITKPath ITKImageIntensity ITKLabelMap ITKMathematicalMorphology ITKQuadEdgeMesh ITKFastMarching ITKIOImageBase ITKSmoothing ITKImageFeature ITKOptimizers ITKPolynomials ITKBiasCorrection ITKColormap ITKFFT ITKConvolution ITKDICOMParser ITKDeformableMesh ITKDenoising ITKDeprecated ITKDiffusionTensorImage ITKEXPAT gdcmjpeg8 gdcmjpeg12 gdcmjpeg16 gdcmopenjp2 gdcmcharls gdcmuuid gdcmsocketxx gdcmCommon gdcmDICT gdcmDSED gdcmIOD gdcmMSFF gdcmMEXD ITKznz ITKniftiio ITKgiftiio ITKPDEDeformableRegistration hdf5-shared hdf5_cpp-shared ITKIOBMP ITKIOBioRad ITKIOBruker ITKIOCSV ITKIOGDCM ITKIOIPL ITKIOGE ITKIOGIPL ITKIOHDF5 itkjpeg ITKIOJPEG itkopenjpeg ITKIOJPEG2000 itktiff ITKIOTIFF ITKIOLSM itkminc2 ITKIOMINC ITKIOMRC ITKIOMeshBase ITKIOMeshBYU ITKIOMeshFreeSurfer ITKIOMeshGifti ITKIOMeshOBJ ITKIOMeshOFF ITKIOMeshVTK ITKIOMeta ITKIONIFTI ITKNrrdIO ITKIONRRD itkpng ITKIOPNG ITKIOSiemens ITKIOXML ITKIOSpatialObjects ITKIOStimulate ITKTransformFactory ITKIOTransformBase ITKIOTransformHDF5 ITKIOTransformInsightLegacy ITKIOTransformMatlab ITKIOVTK ITKKLMRegionGrowing itklbfgs ITKMarkovRandomFieldsClassifiers ITKOptimizersv4 ITKQuadEdgeMeshFiltering ITKRegionGrowing ITKRegistrationMethodsv4 itkTestDriver ITKTestKernel ITKVTK ITKVideoCore ITKVideoIO ITKWatersheds)
  list(APPEND _cmake_expected_targets "${_cmake_expected_target}")
  if(TARGET "${_cmake_expected_target}")
    list(APPEND _cmake_targets_defined "${_cmake_expected_target}")
  else()
    list(APPEND _cmake_targets_not_defined "${_cmake_expected_target}")
  endif()
endforeach()
unset(_cmake_expected_target)
if(_cmake_targets_defined STREQUAL _cmake_expected_targets)
  unset(_cmake_targets_defined)
  unset(_cmake_targets_not_defined)
  unset(_cmake_expected_targets)
  unset(CMAKE_IMPORT_FILE_VERSION)
  cmake_policy(POP)
  return()
endif()
if(NOT _cmake_targets_defined STREQUAL "")
  string(REPLACE ";" ", " _cmake_targets_defined_text "${_cmake_targets_defined}")
  string(REPLACE ";" ", " _cmake_targets_not_defined_text "${_cmake_targets_not_defined}")
  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_cmake_targets_defined_text}\nTargets not yet defined: ${_cmake_targets_not_defined_text}\n")
endif()
unset(_cmake_targets_defined)
unset(_cmake_targets_not_defined)
unset(_cmake_expected_targets)


# Compute the installation prefix relative to this file.
get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
if(_IMPORT_PREFIX STREQUAL "/")
  set(_IMPORT_PREFIX "")
endif()

# Create imported target itkdouble-conversion
add_library(itkdouble-conversion SHARED IMPORTED)

# Create imported target itksys
add_library(itksys SHARED IMPORTED)

set_target_properties(itksys PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/ITK-5.2"
  INTERFACE_LINK_LIBRARIES "dl;dl"
)

# Create imported target itkvcl
add_library(itkvcl SHARED IMPORTED)

set_target_properties(itkvcl PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/ITK-5.2"
  INTERFACE_LINK_LIBRARIES "m"
)

# Create imported target itkv3p_netlib
add_library(itkv3p_netlib SHARED IMPORTED)

set_target_properties(itkv3p_netlib PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/ITK-5.2"
  INTERFACE_LINK_LIBRARIES "m"
)

# Create imported target itkvnl
add_library(itkvnl SHARED IMPORTED)

set_target_properties(itkvnl PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/ITK-5.2"
  INTERFACE_LINK_LIBRARIES "itkvcl"
)

# Create imported target itkvnl_algo
add_library(itkvnl_algo SHARED IMPORTED)

set_target_properties(itkvnl_algo PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/ITK-5.2"
  INTERFACE_LINK_LIBRARIES "itkv3p_netlib;itkvnl"
)

# Create imported target itktestlib
add_library(itktestlib SHARED IMPORTED)

set_target_properties(itktestlib PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/ITK-5.2"
  INTERFACE_LINK_LIBRARIES "itkvcl"
)

# Create imported target ITKVNLInstantiation
add_library(ITKVNLInstantiation SHARED IMPORTED)

set_target_properties(ITKVNLInstantiation PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "itkvnl_algo;itkvnl;itkv3p_netlib;itkvcl;itkvnl_algo;itkvnl;itkv3p_netlib;itkvcl"
)

# Create imported target ITKCommon
add_library(ITKCommon SHARED IMPORTED)

set_target_properties(ITKCommon PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKInternalEigen3::Eigen;itksys;ITKVNLInstantiation;-lm;dl"
)

# Create imported target itkNetlibSlatec
add_library(itkNetlibSlatec SHARED IMPORTED)

set_target_properties(itkNetlibSlatec PROPERTIES
  INTERFACE_LINK_LIBRARIES "itkv3p_netlib"
)

# Create imported target ITKStatistics
add_library(ITKStatistics SHARED IMPORTED)

set_target_properties(ITKStatistics PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;itkNetlibSlatec"
)

# Create imported target ITKTransform
add_library(ITKTransform SHARED IMPORTED)

set_target_properties(ITKTransform PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon"
)

# Create imported target ITKMesh
add_library(ITKMesh SHARED IMPORTED)

set_target_properties(ITKMesh PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKTransform"
)

# Create imported target itkzlib
add_library(itkzlib SHARED IMPORTED)

set_target_properties(itkzlib PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
)

# Create imported target ITKMetaIO
add_library(ITKMetaIO SHARED IMPORTED)

set_target_properties(ITKMetaIO PROPERTIES
  INTERFACE_LINK_LIBRARIES "itkzlib"
)

# Create imported target ITKSpatialObjects
add_library(ITKSpatialObjects SHARED IMPORTED)

set_target_properties(ITKSpatialObjects PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKTransform"
)

# Create imported target ITKPath
add_library(ITKPath SHARED IMPORTED)

set_target_properties(ITKPath PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
)

# Create imported target ITKImageIntensity
add_library(ITKImageIntensity SHARED IMPORTED)

set_target_properties(ITKImageIntensity PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
)

# Create imported target ITKLabelMap
add_library(ITKLabelMap SHARED IMPORTED)

set_target_properties(ITKLabelMap PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKStatistics;ITKTransform;ITKSpatialObjects;ITKPath"
)

# Create imported target ITKMathematicalMorphology
add_library(ITKMathematicalMorphology SHARED IMPORTED)

set_target_properties(ITKMathematicalMorphology PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKStatistics;ITKTransform;ITKSpatialObjects;ITKPath"
)

# Create imported target ITKQuadEdgeMesh
add_library(ITKQuadEdgeMesh SHARED IMPORTED)

set_target_properties(ITKQuadEdgeMesh PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
)

# Create imported target ITKFastMarching
add_library(ITKFastMarching SHARED IMPORTED)

set_target_properties(ITKFastMarching PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
)

# Create imported target ITKIOImageBase
add_library(ITKIOImageBase SHARED IMPORTED)

set_target_properties(ITKIOImageBase PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon"
)

# Create imported target ITKSmoothing
add_library(ITKSmoothing SHARED IMPORTED)

set_target_properties(ITKSmoothing PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
)

# Create imported target ITKImageFeature
add_library(ITKImageFeature SHARED IMPORTED)

set_target_properties(ITKImageFeature PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKSmoothing;ITKSpatialObjects"
)

# Create imported target ITKOptimizers
add_library(ITKOptimizers SHARED IMPORTED)

set_target_properties(ITKOptimizers PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKStatistics"
)

# Create imported target ITKPolynomials
add_library(ITKPolynomials SHARED IMPORTED)

set_target_properties(ITKPolynomials PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon"
)

# Create imported target ITKBiasCorrection
add_library(ITKBiasCorrection SHARED IMPORTED)

set_target_properties(ITKBiasCorrection PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKStatistics;ITKTransform;ITKSpatialObjects;ITKPath"
)

# Create imported target ITKColormap
add_library(ITKColormap SHARED IMPORTED)

set_target_properties(ITKColormap PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
)

# Create imported target ITKFFT
add_library(ITKFFT SHARED IMPORTED)

set_target_properties(ITKFFT PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon"
)

# Create imported target ITKConvolution
add_library(ITKConvolution SHARED IMPORTED)

set_target_properties(ITKConvolution PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKFFT;ITKCommon;ITKStatistics;ITKTransform;ITKSpatialObjects;ITKPath;ITKCommon;ITKStatistics;ITKTransform;ITKSpatialObjects;ITKPath"
)

# Create imported target ITKDICOMParser
add_library(ITKDICOMParser SHARED IMPORTED)

# Create imported target ITKDeformableMesh
add_library(ITKDeformableMesh SHARED IMPORTED)

set_target_properties(ITKDeformableMesh PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKStatistics;ITKTransform;ITKImageFeature;ITKCommon;ITKStatistics;ITKTransform;ITKSpatialObjects;ITKPath;ITKMesh;ITKCommon;ITKStatistics;ITKTransform;ITKSpatialObjects;ITKPath"
)

# Create imported target ITKDenoising
add_library(ITKDenoising SHARED IMPORTED)

set_target_properties(ITKDenoising PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
)

# Create imported target ITKDeprecated
add_library(ITKDeprecated SHARED IMPORTED)

set_target_properties(ITKDeprecated PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKCommon;ITKStatistics;ITKTransform;ITKTransform"
)

# Create imported target ITKDiffusionTensorImage
add_library(ITKDiffusionTensorImage SHARED IMPORTED)

set_target_properties(ITKDiffusionTensorImage PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
)

# Create imported target ITKEXPAT
add_library(ITKEXPAT SHARED IMPORTED)

# Create imported target gdcmjpeg8
add_library(gdcmjpeg8 SHARED IMPORTED)

# Create imported target gdcmjpeg12
add_library(gdcmjpeg12 SHARED IMPORTED)

# Create imported target gdcmjpeg16
add_library(gdcmjpeg16 SHARED IMPORTED)

# Create imported target gdcmopenjp2
add_library(gdcmopenjp2 SHARED IMPORTED)

set_target_properties(gdcmopenjp2 PROPERTIES
  INTERFACE_LINK_LIBRARIES "m"
)

# Create imported target gdcmcharls
add_library(gdcmcharls SHARED IMPORTED)

# Create imported target gdcmuuid
add_library(gdcmuuid SHARED IMPORTED)

# Create imported target gdcmsocketxx
add_library(gdcmsocketxx SHARED IMPORTED)

set_target_properties(gdcmsocketxx PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr"
)

# Create imported target gdcmCommon
add_library(gdcmCommon SHARED IMPORTED)

set_target_properties(gdcmCommon PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/ITK-5.2"
)

# Create imported target gdcmDICT
add_library(gdcmDICT SHARED IMPORTED)

set_target_properties(gdcmDICT PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/ITK-5.2"
)

# Create imported target gdcmDSED
add_library(gdcmDSED SHARED IMPORTED)

set_target_properties(gdcmDSED PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/ITK-5.2"
  INTERFACE_LINK_LIBRARIES "gdcmCommon"
)

# Create imported target gdcmIOD
add_library(gdcmIOD SHARED IMPORTED)

set_target_properties(gdcmIOD PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/ITK-5.2"
  INTERFACE_LINK_LIBRARIES "gdcmDSED;gdcmCommon"
)

# Create imported target gdcmMSFF
add_library(gdcmMSFF SHARED IMPORTED)

set_target_properties(gdcmMSFF PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/ITK-5.2"
  INTERFACE_LINK_LIBRARIES "gdcmIOD;gdcmDSED;gdcmDICT"
)

# Create imported target gdcmMEXD
add_library(gdcmMEXD SHARED IMPORTED)

set_target_properties(gdcmMEXD PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/ITK-5.2"
)

# Create imported target ITKznz
add_library(ITKznz SHARED IMPORTED)

set_target_properties(ITKznz PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/ITK-5.2;${_IMPORT_PREFIX}/include/ITK-5.2"
  INTERFACE_LINK_LIBRARIES "itkzlib"
)

# Create imported target ITKniftiio
add_library(ITKniftiio SHARED IMPORTED)

set_target_properties(ITKniftiio PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include/ITK-5.2;${_IMPORT_PREFIX}/include/ITK-5.2"
  INTERFACE_LINK_LIBRARIES "ITKznz;m"
)

# Create imported target ITKgiftiio
add_library(ITKgiftiio SHARED IMPORTED)

set_target_properties(ITKgiftiio PROPERTIES
  INTERFACE_LINK_LIBRARIES "ITKEXPAT;ITKznz;ITKniftiio"
)

# Create imported target ITKPDEDeformableRegistration
add_library(ITKPDEDeformableRegistration SHARED IMPORTED)

set_target_properties(ITKPDEDeformableRegistration PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKCommon;ITKStatistics;ITKTransform;ITKSpatialObjects;ITKPath;ITKSmoothing;ITKImageFeature;ITKOptimizers"
)

# Create imported target hdf5-shared
add_library(hdf5-shared SHARED IMPORTED)

set_target_properties(hdf5-shared PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "H5_BUILT_AS_DYNAMIC_LIB;_GNU_SOURCE;_FILE_OFFSET_BITS=64;_LARGEFILE64_SOURCE;_LARGEFILE_SOURCE"
  INTERFACE_INCLUDE_DIRECTORIES "\$<\$<BOOL:OFF>:>;${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "\$<\$<NOT:\$<PLATFORM_ID:Windows>>:dl>"
)

# Create imported target hdf5_cpp-shared
add_library(hdf5_cpp-shared SHARED IMPORTED)

set_target_properties(hdf5_cpp-shared PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "H5_BUILT_AS_DYNAMIC_LIB"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "hdf5-shared"
)

# Create imported target ITKIOBMP
add_library(ITKIOBMP SHARED IMPORTED)

set_target_properties(ITKIOBMP PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target ITKIOBioRad
add_library(ITKIOBioRad SHARED IMPORTED)

set_target_properties(ITKIOBioRad PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target ITKIOBruker
add_library(ITKIOBruker SHARED IMPORTED)

set_target_properties(ITKIOBruker PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target ITKIOCSV
add_library(ITKIOCSV SHARED IMPORTED)

set_target_properties(ITKIOCSV PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
)

# Create imported target ITKIOGDCM
add_library(ITKIOGDCM SHARED IMPORTED)

set_target_properties(ITKIOGDCM PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKIOImageBase"
)

# Create imported target ITKIOIPL
add_library(ITKIOIPL SHARED IMPORTED)

set_target_properties(ITKIOIPL PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target ITKIOGE
add_library(ITKIOGE SHARED IMPORTED)

set_target_properties(ITKIOGE PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOIPL"
)

# Create imported target ITKIOGIPL
add_library(ITKIOGIPL SHARED IMPORTED)

set_target_properties(ITKIOGIPL PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target ITKIOHDF5
add_library(ITKIOHDF5 SHARED IMPORTED)

set_target_properties(ITKIOHDF5 PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target itkjpeg
add_library(itkjpeg SHARED IMPORTED)

# Create imported target ITKIOJPEG
add_library(ITKIOJPEG SHARED IMPORTED)

set_target_properties(ITKIOJPEG PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target itkopenjpeg
add_library(itkopenjpeg SHARED IMPORTED)

set_target_properties(itkopenjpeg PROPERTIES
  INTERFACE_LINK_LIBRARIES "m"
)

# Create imported target ITKIOJPEG2000
add_library(ITKIOJPEG2000 SHARED IMPORTED)

set_target_properties(ITKIOJPEG2000 PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target itktiff
add_library(itktiff SHARED IMPORTED)

set_target_properties(itktiff PROPERTIES
  INTERFACE_LINK_LIBRARIES "itkzlib;itkjpeg;-lm"
)

# Create imported target ITKIOTIFF
add_library(ITKIOTIFF SHARED IMPORTED)

set_target_properties(ITKIOTIFF PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target ITKIOLSM
add_library(ITKIOLSM SHARED IMPORTED)

set_target_properties(ITKIOLSM PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOTIFF"
)

# Create imported target itkminc2
add_library(itkminc2 SHARED IMPORTED)

set_target_properties(itkminc2 PROPERTIES
  INTERFACE_LINK_LIBRARIES "hdf5_cpp-shared;hdf5-shared;itkzlib;rt;m;dl"
)

# Create imported target ITKIOMINC
add_library(ITKIOMINC SHARED IMPORTED)

set_target_properties(ITKIOMINC PROPERTIES
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target ITKIOMRC
add_library(ITKIOMRC SHARED IMPORTED)

set_target_properties(ITKIOMRC PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target ITKIOMeshBase
add_library(ITKIOMeshBase SHARED IMPORTED)

set_target_properties(ITKIOMeshBase PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKIOImageBase;ITKMesh;ITKQuadEdgeMesh;ITKCommon;ITKMesh"
)

# Create imported target ITKIOMeshBYU
add_library(ITKIOMeshBYU SHARED IMPORTED)

set_target_properties(ITKIOMeshBYU PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKIOMeshBase"
)

# Create imported target ITKIOMeshFreeSurfer
add_library(ITKIOMeshFreeSurfer SHARED IMPORTED)

set_target_properties(ITKIOMeshFreeSurfer PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKIOMeshBase"
)

# Create imported target ITKIOMeshGifti
add_library(ITKIOMeshGifti SHARED IMPORTED)

set_target_properties(ITKIOMeshGifti PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKIOMeshBase"
)

# Create imported target ITKIOMeshOBJ
add_library(ITKIOMeshOBJ SHARED IMPORTED)

set_target_properties(ITKIOMeshOBJ PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKIOMeshBase"
)

# Create imported target ITKIOMeshOFF
add_library(ITKIOMeshOFF SHARED IMPORTED)

set_target_properties(ITKIOMeshOFF PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKIOMeshBase"
)

# Create imported target ITKIOMeshVTK
add_library(ITKIOMeshVTK SHARED IMPORTED)

set_target_properties(ITKIOMeshVTK PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKIOMeshBase"
)

# Create imported target ITKIOMeta
add_library(ITKIOMeta SHARED IMPORTED)

set_target_properties(ITKIOMeta PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase;ITKMetaIO"
)

# Create imported target ITKIONIFTI
add_library(ITKIONIFTI SHARED IMPORTED)

set_target_properties(ITKIONIFTI PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target ITKNrrdIO
add_library(ITKNrrdIO SHARED IMPORTED)

set_target_properties(ITKNrrdIO PROPERTIES
  INTERFACE_LINK_LIBRARIES "itkzlib;m"
)

# Create imported target ITKIONRRD
add_library(ITKIONRRD SHARED IMPORTED)

set_target_properties(ITKIONRRD PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target itkpng
add_library(itkpng SHARED IMPORTED)

set_target_properties(itkpng PROPERTIES
  INTERFACE_LINK_LIBRARIES "itkzlib"
)

# Create imported target ITKIOPNG
add_library(ITKIOPNG SHARED IMPORTED)

set_target_properties(ITKIOPNG PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target ITKIOSiemens
add_library(ITKIOSiemens SHARED IMPORTED)

set_target_properties(ITKIOSiemens PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target ITKIOXML
add_library(ITKIOXML SHARED IMPORTED)

set_target_properties(ITKIOXML PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target ITKIOSpatialObjects
add_library(ITKIOSpatialObjects SHARED IMPORTED)

set_target_properties(ITKIOSpatialObjects PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKSpatialObjects"
)

# Create imported target ITKIOStimulate
add_library(ITKIOStimulate SHARED IMPORTED)

set_target_properties(ITKIOStimulate PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase"
)

# Create imported target ITKTransformFactory
add_library(ITKTransformFactory SHARED IMPORTED)

set_target_properties(ITKTransformFactory PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKTransform"
)

# Create imported target ITKIOTransformBase
add_library(ITKIOTransformBase SHARED IMPORTED)

set_target_properties(ITKIOTransformBase PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKTransform;ITKTransformFactory"
)

# Create imported target ITKIOTransformHDF5
add_library(ITKIOTransformHDF5 SHARED IMPORTED)

set_target_properties(ITKIOTransformHDF5 PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOTransformBase"
)

# Create imported target ITKIOTransformInsightLegacy
add_library(ITKIOTransformInsightLegacy SHARED IMPORTED)

set_target_properties(ITKIOTransformInsightLegacy PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOTransformBase"
)

# Create imported target ITKIOTransformMatlab
add_library(ITKIOTransformMatlab SHARED IMPORTED)

set_target_properties(ITKIOTransformMatlab PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOTransformBase"
)

# Create imported target ITKIOVTK
add_library(ITKIOVTK SHARED IMPORTED)

set_target_properties(ITKIOVTK PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
)

# Create imported target ITKKLMRegionGrowing
add_library(ITKKLMRegionGrowing SHARED IMPORTED)

set_target_properties(ITKKLMRegionGrowing PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon"
)

# Create imported target itklbfgs
add_library(itklbfgs SHARED IMPORTED)

set_target_properties(itklbfgs PROPERTIES
  INTERFACE_LINK_LIBRARIES "m"
)

# Create imported target ITKMarkovRandomFieldsClassifiers
add_library(ITKMarkovRandomFieldsClassifiers SHARED IMPORTED)

set_target_properties(ITKMarkovRandomFieldsClassifiers PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKStatistics;ITKTransform;ITKSpatialObjects;ITKPath;ITKStatistics"
)

# Create imported target ITKOptimizersv4
add_library(ITKOptimizersv4 SHARED IMPORTED)

set_target_properties(ITKOptimizersv4 PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKOptimizers"
)

# Create imported target ITKQuadEdgeMeshFiltering
add_library(ITKQuadEdgeMeshFiltering SHARED IMPORTED)

set_target_properties(ITKQuadEdgeMeshFiltering PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKMesh"
)

# Create imported target ITKRegionGrowing
add_library(ITKRegionGrowing SHARED IMPORTED)

set_target_properties(ITKRegionGrowing PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKStatistics;ITKTransform;ITKSpatialObjects;ITKPath"
)

# Create imported target ITKRegistrationMethodsv4
add_library(ITKRegistrationMethodsv4 SHARED IMPORTED)

set_target_properties(ITKRegistrationMethodsv4 PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKOptimizersv4;ITKStatistics;ITKTransform;ITKSpatialObjects;ITKPath;ITKSmoothing;ITKImageFeature;ITKOptimizers;ITKOptimizersv4"
)

# Create imported target itkTestDriver
add_executable(itkTestDriver IMPORTED)

# Create imported target ITKTestKernel
add_library(ITKTestKernel SHARED IMPORTED)

set_target_properties(ITKTestKernel PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKIOImageBase"
)

# Create imported target ITKVTK
add_library(ITKVTK SHARED IMPORTED)

set_target_properties(ITKVTK PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
)

# Create imported target ITKVideoCore
add_library(ITKVideoCore SHARED IMPORTED)

set_target_properties(ITKVideoCore PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon"
)

# Create imported target ITKVideoIO
add_library(ITKVideoIO SHARED IMPORTED)

set_target_properties(ITKVideoIO PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKIOImageBase;ITKVideoCore"
)

# Create imported target ITKWatersheds
add_library(ITKWatersheds SHARED IMPORTED)

set_target_properties(ITKWatersheds PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_nullptr;cxx_override;cxx_constexpr;cxx_range_for;cxx_rvalue_references;cxx_static_assert;cxx_strong_enums;cxx_lambdas;cxx_noexcept;cxx_alias_templates"
  INTERFACE_LINK_LIBRARIES "ITKCommon;ITKStatistics;ITKTransform;ITKSpatialObjects;ITKPath;ITKSmoothing;ITKCommon;ITKStatistics;ITKTransform;ITKSpatialObjects;ITKPath;ITKMathematicalMorphology;ITKSmoothing;ITKCommon;ITKStatistics;ITKTransform;ITKSpatialObjects;ITKPath"
)

if(CMAKE_VERSION VERSION_LESS 2.8.12)
  message(FATAL_ERROR "This file relies on consumers using CMake 2.8.12 or greater.")
endif()

# Load information for each installed configuration.
file(GLOB _cmake_config_files "${CMAKE_CURRENT_LIST_DIR}/ITKTargets-*.cmake")
foreach(_cmake_config_file IN LISTS _cmake_config_files)
  include("${_cmake_config_file}")
endforeach()
unset(_cmake_config_file)
unset(_cmake_config_files)

# Cleanup temporary variables.
set(_IMPORT_PREFIX)

# Loop over all imported files and verify that they actually exist
foreach(_cmake_target IN LISTS _cmake_import_check_targets)
  foreach(_cmake_file IN LISTS "_cmake_import_check_files_for_${_cmake_target}")
    if(NOT EXISTS "${_cmake_file}")
      message(FATAL_ERROR "The imported target \"${_cmake_target}\" references the file
   \"${_cmake_file}\"
but this file does not exist.  Possible reasons include:
* The file was deleted, renamed, or moved to another location.
* An install or uninstall procedure did not complete successfully.
* The installation package was faulty and contained
   \"${CMAKE_CURRENT_LIST_FILE}\"
but not all the files it references.
")
    endif()
  endforeach()
  unset(_cmake_file)
  unset("_cmake_import_check_files_for_${_cmake_target}")
endforeach()
unset(_cmake_target)
unset(_cmake_import_check_targets)

# This file does not depend on other imported targets which have
# been exported from the same project but in a separate export set.

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
cmake_policy(POP)
