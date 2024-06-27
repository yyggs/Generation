set(ITKIONRRD_LOADED 1)
set(ITKIONRRD_ENABLE_SHARED "1")
set(ITKIONRRD_DEPENDS "ITKIOImageBase;ITKNrrdIO")
set(ITKIONRRD_PUBLIC_DEPENDS "ITKIOImageBase")
set(ITKIONRRD_TRANSITIVE_DEPENDS "ITKIOImageBase")
set(ITKIONRRD_PRIVATE_DEPENDS "ITKNrrdIO")
set(ITKIONRRD_LIBRARIES "ITKIONRRD")
set(ITKIONRRD_INCLUDE_DIRS "${ITK_INSTALL_PREFIX}/include/ITK-5.2")
set(ITKIONRRD_LIBRARY_DIRS "")
set(ITKIONRRD_RUNTIME_LIBRARY_DIRS "${ITK_INSTALL_PREFIX}/lib")
set(ITKIONRRD_TARGETS_FILE "")
set(ITKIONRRD_FACTORY_NAMES "ImageIO::Nrrd")
