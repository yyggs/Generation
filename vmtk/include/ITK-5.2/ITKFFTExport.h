
#ifndef ITKFFT_EXPORT_H
#define ITKFFT_EXPORT_H

#ifdef ITK_STATIC
#  define ITKFFT_EXPORT
#  define ITKFFT_HIDDEN
#else
#  ifndef ITKFFT_EXPORT
#    ifdef ITKFFT_EXPORTS
        /* We are building this library */
#      define ITKFFT_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKFFT_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKFFT_HIDDEN
#    define ITKFFT_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKFFT_DEPRECATED
#  define ITKFFT_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKFFT_DEPRECATED_EXPORT
#  define ITKFFT_DEPRECATED_EXPORT ITKFFT_EXPORT ITKFFT_DEPRECATED
#endif

#ifndef ITKFFT_DEPRECATED_NO_EXPORT
#  define ITKFFT_DEPRECATED_NO_EXPORT ITKFFT_HIDDEN ITKFFT_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKFFT_NO_DEPRECATED
#    define ITKFFT_NO_DEPRECATED
#  endif
#endif

#endif /* ITKFFT_EXPORT_H */
