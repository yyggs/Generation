
#ifndef ITKIOImageBase_EXPORT_H
#define ITKIOImageBase_EXPORT_H

#ifdef ITK_STATIC
#  define ITKIOImageBase_EXPORT
#  define ITKIOImageBase_HIDDEN
#else
#  ifndef ITKIOImageBase_EXPORT
#    ifdef ITKIOImageBase_EXPORTS
        /* We are building this library */
#      define ITKIOImageBase_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKIOImageBase_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKIOImageBase_HIDDEN
#    define ITKIOImageBase_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKIOIMAGEBASE_DEPRECATED
#  define ITKIOIMAGEBASE_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKIOIMAGEBASE_DEPRECATED_EXPORT
#  define ITKIOIMAGEBASE_DEPRECATED_EXPORT ITKIOImageBase_EXPORT ITKIOIMAGEBASE_DEPRECATED
#endif

#ifndef ITKIOIMAGEBASE_DEPRECATED_NO_EXPORT
#  define ITKIOIMAGEBASE_DEPRECATED_NO_EXPORT ITKIOImageBase_HIDDEN ITKIOIMAGEBASE_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKIOIMAGEBASE_NO_DEPRECATED
#    define ITKIOIMAGEBASE_NO_DEPRECATED
#  endif
#endif

#endif /* ITKIOImageBase_EXPORT_H */
