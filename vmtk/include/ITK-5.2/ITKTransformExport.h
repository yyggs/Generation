
#ifndef ITKTransform_EXPORT_H
#define ITKTransform_EXPORT_H

#ifdef ITK_STATIC
#  define ITKTransform_EXPORT
#  define ITKTransform_HIDDEN
#else
#  ifndef ITKTransform_EXPORT
#    ifdef ITKTransform_EXPORTS
        /* We are building this library */
#      define ITKTransform_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKTransform_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKTransform_HIDDEN
#    define ITKTransform_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKTRANSFORM_DEPRECATED
#  define ITKTRANSFORM_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKTRANSFORM_DEPRECATED_EXPORT
#  define ITKTRANSFORM_DEPRECATED_EXPORT ITKTransform_EXPORT ITKTRANSFORM_DEPRECATED
#endif

#ifndef ITKTRANSFORM_DEPRECATED_NO_EXPORT
#  define ITKTRANSFORM_DEPRECATED_NO_EXPORT ITKTransform_HIDDEN ITKTRANSFORM_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKTRANSFORM_NO_DEPRECATED
#    define ITKTRANSFORM_NO_DEPRECATED
#  endif
#endif

#endif /* ITKTransform_EXPORT_H */
