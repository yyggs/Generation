
#ifndef ITKIOHDF5_EXPORT_H
#define ITKIOHDF5_EXPORT_H

#ifdef ITK_STATIC
#  define ITKIOHDF5_EXPORT
#  define ITKIOHDF5_HIDDEN
#else
#  ifndef ITKIOHDF5_EXPORT
#    ifdef ITKIOHDF5_EXPORTS
        /* We are building this library */
#      define ITKIOHDF5_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKIOHDF5_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKIOHDF5_HIDDEN
#    define ITKIOHDF5_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKIOHDF5_DEPRECATED
#  define ITKIOHDF5_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKIOHDF5_DEPRECATED_EXPORT
#  define ITKIOHDF5_DEPRECATED_EXPORT ITKIOHDF5_EXPORT ITKIOHDF5_DEPRECATED
#endif

#ifndef ITKIOHDF5_DEPRECATED_NO_EXPORT
#  define ITKIOHDF5_DEPRECATED_NO_EXPORT ITKIOHDF5_HIDDEN ITKIOHDF5_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKIOHDF5_NO_DEPRECATED
#    define ITKIOHDF5_NO_DEPRECATED
#  endif
#endif

#endif /* ITKIOHDF5_EXPORT_H */
