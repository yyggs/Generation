
#ifndef ITKDeformableMesh_EXPORT_H
#define ITKDeformableMesh_EXPORT_H

#ifdef ITK_STATIC
#  define ITKDeformableMesh_EXPORT
#  define ITKDeformableMesh_HIDDEN
#else
#  ifndef ITKDeformableMesh_EXPORT
#    ifdef ITKDeformableMesh_EXPORTS
        /* We are building this library */
#      define ITKDeformableMesh_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKDeformableMesh_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKDeformableMesh_HIDDEN
#    define ITKDeformableMesh_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKDEFORMABLEMESH_DEPRECATED
#  define ITKDEFORMABLEMESH_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKDEFORMABLEMESH_DEPRECATED_EXPORT
#  define ITKDEFORMABLEMESH_DEPRECATED_EXPORT ITKDeformableMesh_EXPORT ITKDEFORMABLEMESH_DEPRECATED
#endif

#ifndef ITKDEFORMABLEMESH_DEPRECATED_NO_EXPORT
#  define ITKDEFORMABLEMESH_DEPRECATED_NO_EXPORT ITKDeformableMesh_HIDDEN ITKDEFORMABLEMESH_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKDEFORMABLEMESH_NO_DEPRECATED
#    define ITKDEFORMABLEMESH_NO_DEPRECATED
#  endif
#endif

#endif /* ITKDeformableMesh_EXPORT_H */
