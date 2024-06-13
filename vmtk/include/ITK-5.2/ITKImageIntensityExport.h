
#ifndef ITKImageIntensity_EXPORT_H
#define ITKImageIntensity_EXPORT_H

#ifdef ITK_STATIC
#  define ITKImageIntensity_EXPORT
#  define ITKImageIntensity_HIDDEN
#else
#  ifndef ITKImageIntensity_EXPORT
#    ifdef ITKImageIntensity_EXPORTS
        /* We are building this library */
#      define ITKImageIntensity_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKImageIntensity_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKImageIntensity_HIDDEN
#    define ITKImageIntensity_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKIMAGEINTENSITY_DEPRECATED
#  define ITKIMAGEINTENSITY_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKIMAGEINTENSITY_DEPRECATED_EXPORT
#  define ITKIMAGEINTENSITY_DEPRECATED_EXPORT ITKImageIntensity_EXPORT ITKIMAGEINTENSITY_DEPRECATED
#endif

#ifndef ITKIMAGEINTENSITY_DEPRECATED_NO_EXPORT
#  define ITKIMAGEINTENSITY_DEPRECATED_NO_EXPORT ITKImageIntensity_HIDDEN ITKIMAGEINTENSITY_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKIMAGEINTENSITY_NO_DEPRECATED
#    define ITKIMAGEINTENSITY_NO_DEPRECATED
#  endif
#endif

#endif /* ITKImageIntensity_EXPORT_H */
