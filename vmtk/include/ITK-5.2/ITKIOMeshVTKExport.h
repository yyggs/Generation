
#ifndef ITKIOMeshVTK_EXPORT_H
#define ITKIOMeshVTK_EXPORT_H

#ifdef ITK_STATIC
#  define ITKIOMeshVTK_EXPORT
#  define ITKIOMeshVTK_HIDDEN
#else
#  ifndef ITKIOMeshVTK_EXPORT
#    ifdef ITKIOMeshVTK_EXPORTS
        /* We are building this library */
#      define ITKIOMeshVTK_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKIOMeshVTK_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKIOMeshVTK_HIDDEN
#    define ITKIOMeshVTK_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKIOMESHVTK_DEPRECATED
#  define ITKIOMESHVTK_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKIOMESHVTK_DEPRECATED_EXPORT
#  define ITKIOMESHVTK_DEPRECATED_EXPORT ITKIOMeshVTK_EXPORT ITKIOMESHVTK_DEPRECATED
#endif

#ifndef ITKIOMESHVTK_DEPRECATED_NO_EXPORT
#  define ITKIOMESHVTK_DEPRECATED_NO_EXPORT ITKIOMeshVTK_HIDDEN ITKIOMESHVTK_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKIOMESHVTK_NO_DEPRECATED
#    define ITKIOMESHVTK_NO_DEPRECATED
#  endif
#endif

#endif /* ITKIOMeshVTK_EXPORT_H */
