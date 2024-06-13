
#ifndef ITKIOMRC_EXPORT_H
#define ITKIOMRC_EXPORT_H

#ifdef ITK_STATIC
#  define ITKIOMRC_EXPORT
#  define ITKIOMRC_HIDDEN
#else
#  ifndef ITKIOMRC_EXPORT
#    ifdef ITKIOMRC_EXPORTS
        /* We are building this library */
#      define ITKIOMRC_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKIOMRC_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKIOMRC_HIDDEN
#    define ITKIOMRC_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKIOMRC_DEPRECATED
#  define ITKIOMRC_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKIOMRC_DEPRECATED_EXPORT
#  define ITKIOMRC_DEPRECATED_EXPORT ITKIOMRC_EXPORT ITKIOMRC_DEPRECATED
#endif

#ifndef ITKIOMRC_DEPRECATED_NO_EXPORT
#  define ITKIOMRC_DEPRECATED_NO_EXPORT ITKIOMRC_HIDDEN ITKIOMRC_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKIOMRC_NO_DEPRECATED
#    define ITKIOMRC_NO_DEPRECATED
#  endif
#endif

#endif /* ITKIOMRC_EXPORT_H */
