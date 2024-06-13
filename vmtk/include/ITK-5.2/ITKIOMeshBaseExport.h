
#ifndef ITKIOMeshBase_EXPORT_H
#define ITKIOMeshBase_EXPORT_H

#ifdef ITK_STATIC
#  define ITKIOMeshBase_EXPORT
#  define ITKIOMeshBase_HIDDEN
#else
#  ifndef ITKIOMeshBase_EXPORT
#    ifdef ITKIOMeshBase_EXPORTS
        /* We are building this library */
#      define ITKIOMeshBase_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKIOMeshBase_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKIOMeshBase_HIDDEN
#    define ITKIOMeshBase_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKIOMESHBASE_DEPRECATED
#  define ITKIOMESHBASE_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKIOMESHBASE_DEPRECATED_EXPORT
#  define ITKIOMESHBASE_DEPRECATED_EXPORT ITKIOMeshBase_EXPORT ITKIOMESHBASE_DEPRECATED
#endif

#ifndef ITKIOMESHBASE_DEPRECATED_NO_EXPORT
#  define ITKIOMESHBASE_DEPRECATED_NO_EXPORT ITKIOMeshBase_HIDDEN ITKIOMESHBASE_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKIOMESHBASE_NO_DEPRECATED
#    define ITKIOMESHBASE_NO_DEPRECATED
#  endif
#endif

#endif /* ITKIOMeshBase_EXPORT_H */
