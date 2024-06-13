
#ifndef ITKIOSiemens_EXPORT_H
#define ITKIOSiemens_EXPORT_H

#ifdef ITK_STATIC
#  define ITKIOSiemens_EXPORT
#  define ITKIOSiemens_HIDDEN
#else
#  ifndef ITKIOSiemens_EXPORT
#    ifdef ITKIOSiemens_EXPORTS
        /* We are building this library */
#      define ITKIOSiemens_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKIOSiemens_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKIOSiemens_HIDDEN
#    define ITKIOSiemens_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKIOSIEMENS_DEPRECATED
#  define ITKIOSIEMENS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKIOSIEMENS_DEPRECATED_EXPORT
#  define ITKIOSIEMENS_DEPRECATED_EXPORT ITKIOSiemens_EXPORT ITKIOSIEMENS_DEPRECATED
#endif

#ifndef ITKIOSIEMENS_DEPRECATED_NO_EXPORT
#  define ITKIOSIEMENS_DEPRECATED_NO_EXPORT ITKIOSiemens_HIDDEN ITKIOSIEMENS_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKIOSIEMENS_NO_DEPRECATED
#    define ITKIOSIEMENS_NO_DEPRECATED
#  endif
#endif

#endif /* ITKIOSiemens_EXPORT_H */
