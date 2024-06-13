
#ifndef ITKIOMeshGifti_EXPORT_H
#define ITKIOMeshGifti_EXPORT_H

#ifdef ITK_STATIC
#  define ITKIOMeshGifti_EXPORT
#  define ITKIOMeshGifti_HIDDEN
#else
#  ifndef ITKIOMeshGifti_EXPORT
#    ifdef ITKIOMeshGifti_EXPORTS
        /* We are building this library */
#      define ITKIOMeshGifti_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKIOMeshGifti_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKIOMeshGifti_HIDDEN
#    define ITKIOMeshGifti_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKIOMESHGIFTI_DEPRECATED
#  define ITKIOMESHGIFTI_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKIOMESHGIFTI_DEPRECATED_EXPORT
#  define ITKIOMESHGIFTI_DEPRECATED_EXPORT ITKIOMeshGifti_EXPORT ITKIOMESHGIFTI_DEPRECATED
#endif

#ifndef ITKIOMESHGIFTI_DEPRECATED_NO_EXPORT
#  define ITKIOMESHGIFTI_DEPRECATED_NO_EXPORT ITKIOMeshGifti_HIDDEN ITKIOMESHGIFTI_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKIOMESHGIFTI_NO_DEPRECATED
#    define ITKIOMESHGIFTI_NO_DEPRECATED
#  endif
#endif

#endif /* ITKIOMeshGifti_EXPORT_H */
