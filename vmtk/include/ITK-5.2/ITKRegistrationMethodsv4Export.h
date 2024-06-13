
#ifndef ITKRegistrationMethodsv4_EXPORT_H
#define ITKRegistrationMethodsv4_EXPORT_H

#ifdef ITK_STATIC
#  define ITKRegistrationMethodsv4_EXPORT
#  define ITKRegistrationMethodsv4_HIDDEN
#else
#  ifndef ITKRegistrationMethodsv4_EXPORT
#    ifdef ITKRegistrationMethodsv4_EXPORTS
        /* We are building this library */
#      define ITKRegistrationMethodsv4_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKRegistrationMethodsv4_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKRegistrationMethodsv4_HIDDEN
#    define ITKRegistrationMethodsv4_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKREGISTRATIONMETHODSV4_DEPRECATED
#  define ITKREGISTRATIONMETHODSV4_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKREGISTRATIONMETHODSV4_DEPRECATED_EXPORT
#  define ITKREGISTRATIONMETHODSV4_DEPRECATED_EXPORT ITKRegistrationMethodsv4_EXPORT ITKREGISTRATIONMETHODSV4_DEPRECATED
#endif

#ifndef ITKREGISTRATIONMETHODSV4_DEPRECATED_NO_EXPORT
#  define ITKREGISTRATIONMETHODSV4_DEPRECATED_NO_EXPORT ITKRegistrationMethodsv4_HIDDEN ITKREGISTRATIONMETHODSV4_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKREGISTRATIONMETHODSV4_NO_DEPRECATED
#    define ITKREGISTRATIONMETHODSV4_NO_DEPRECATED
#  endif
#endif

#endif /* ITKRegistrationMethodsv4_EXPORT_H */
