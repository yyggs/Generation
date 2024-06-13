
#ifndef ITKIOMeshOFF_EXPORT_H
#define ITKIOMeshOFF_EXPORT_H

#ifdef ITK_STATIC
#  define ITKIOMeshOFF_EXPORT
#  define ITKIOMeshOFF_HIDDEN
#else
#  ifndef ITKIOMeshOFF_EXPORT
#    ifdef ITKIOMeshOFF_EXPORTS
        /* We are building this library */
#      define ITKIOMeshOFF_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKIOMeshOFF_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKIOMeshOFF_HIDDEN
#    define ITKIOMeshOFF_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKIOMESHOFF_DEPRECATED
#  define ITKIOMESHOFF_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKIOMESHOFF_DEPRECATED_EXPORT
#  define ITKIOMESHOFF_DEPRECATED_EXPORT ITKIOMeshOFF_EXPORT ITKIOMESHOFF_DEPRECATED
#endif

#ifndef ITKIOMESHOFF_DEPRECATED_NO_EXPORT
#  define ITKIOMESHOFF_DEPRECATED_NO_EXPORT ITKIOMeshOFF_HIDDEN ITKIOMESHOFF_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKIOMESHOFF_NO_DEPRECATED
#    define ITKIOMESHOFF_NO_DEPRECATED
#  endif
#endif

#endif /* ITKIOMeshOFF_EXPORT_H */
