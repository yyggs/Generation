
#ifndef ITKIOIPL_EXPORT_H
#define ITKIOIPL_EXPORT_H

#ifdef ITK_STATIC
#  define ITKIOIPL_EXPORT
#  define ITKIOIPL_HIDDEN
#else
#  ifndef ITKIOIPL_EXPORT
#    ifdef ITKIOIPL_EXPORTS
        /* We are building this library */
#      define ITKIOIPL_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKIOIPL_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKIOIPL_HIDDEN
#    define ITKIOIPL_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKIOIPL_DEPRECATED
#  define ITKIOIPL_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKIOIPL_DEPRECATED_EXPORT
#  define ITKIOIPL_DEPRECATED_EXPORT ITKIOIPL_EXPORT ITKIOIPL_DEPRECATED
#endif

#ifndef ITKIOIPL_DEPRECATED_NO_EXPORT
#  define ITKIOIPL_DEPRECATED_NO_EXPORT ITKIOIPL_HIDDEN ITKIOIPL_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKIOIPL_NO_DEPRECATED
#    define ITKIOIPL_NO_DEPRECATED
#  endif
#endif

#endif /* ITKIOIPL_EXPORT_H */