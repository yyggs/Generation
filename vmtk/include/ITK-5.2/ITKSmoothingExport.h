
#ifndef ITKSmoothing_EXPORT_H
#define ITKSmoothing_EXPORT_H

#ifdef ITK_STATIC
#  define ITKSmoothing_EXPORT
#  define ITKSmoothing_HIDDEN
#else
#  ifndef ITKSmoothing_EXPORT
#    ifdef ITKSmoothing_EXPORTS
        /* We are building this library */
#      define ITKSmoothing_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKSmoothing_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKSmoothing_HIDDEN
#    define ITKSmoothing_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKSMOOTHING_DEPRECATED
#  define ITKSMOOTHING_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKSMOOTHING_DEPRECATED_EXPORT
#  define ITKSMOOTHING_DEPRECATED_EXPORT ITKSmoothing_EXPORT ITKSMOOTHING_DEPRECATED
#endif

#ifndef ITKSMOOTHING_DEPRECATED_NO_EXPORT
#  define ITKSMOOTHING_DEPRECATED_NO_EXPORT ITKSmoothing_HIDDEN ITKSMOOTHING_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKSMOOTHING_NO_DEPRECATED
#    define ITKSMOOTHING_NO_DEPRECATED
#  endif
#endif

#endif /* ITKSmoothing_EXPORT_H */
