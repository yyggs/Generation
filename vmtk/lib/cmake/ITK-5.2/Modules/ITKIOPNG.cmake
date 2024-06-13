set(ITKIOPNG_LOADED 1)
set(ITKIOPNG_ENABLE_SHARED "1")
set(ITKIOPNG_DEPENDS "ITKIOImageBase;ITKPNG")
set(ITKIOPNG_PUBLIC_DEPENDS "ITKIOImageBase")
set(ITKIOPNG_TRANSITIVE_DEPENDS "ITKIOImageBase")
set(ITKIOPNG_PRIVATE_DEPENDS "ITKPNG")
set(ITKIOPNG_LIBRARIES "ITKIOPNG")
set(ITKIOPNG_INCLUDE_DIRS "${ITK_INSTALL_PREFIX}/include/ITK-5.2")
set(ITKIOPNG_LIBRARY_DIRS "")
set(ITKIOPNG_RUNTIME_LIBRARY_DIRS "${ITK_INSTALL_PREFIX}/lib")
set(ITKIOPNG_TARGETS_FILE "")
set(ITKIOPNG_FACTORY_NAMES "ImageIO::PNG")

