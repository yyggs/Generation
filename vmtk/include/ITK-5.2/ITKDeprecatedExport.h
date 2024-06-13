
#ifndef ITKDeprecated_EXPORT_H
#define ITKDeprecated_EXPORT_H

#ifdef ITK_STATIC
#  define ITKDeprecated_EXPORT
#  define ITKDeprecated_HIDDEN
#else
#  ifndef ITKDeprecated_EXPORT
#    ifdef ITKDeprecated_EXPORTS
        /* We are building this library */
#      define ITKDeprecated_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKDeprecated_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKDeprecated_HIDDEN
#    define ITKDeprecated_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKDEPRECATED_DEPRECATED
#  define ITKDEPRECATED_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKDEPRECATED_DEPRECATED_EXPORT
#  define ITKDEPRECATED_DEPRECATED_EXPORT ITKDeprecated_EXPORT ITKDEPRECATED_DEPRECATED
#endif

#ifndef ITKDEPRECATED_DEPRECATED_NO_EXPORT
#  define ITKDEPRECATED_DEPRECATED_NO_EXPORT ITKDeprecated_HIDDEN ITKDEPRECATED_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKDEPRECATED_NO_DEPRECATED
#    define ITKDEPRECATED_NO_DEPRECATED
#  endif
#endif

#endif /* ITKDeprecated_EXPORT_H */
