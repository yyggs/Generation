
#ifndef ITKMarkovRandomFieldsClassifiers_EXPORT_H
#define ITKMarkovRandomFieldsClassifiers_EXPORT_H

#ifdef ITK_STATIC
#  define ITKMarkovRandomFieldsClassifiers_EXPORT
#  define ITKMarkovRandomFieldsClassifiers_HIDDEN
#else
#  ifndef ITKMarkovRandomFieldsClassifiers_EXPORT
#    ifdef ITKMarkovRandomFieldsClassifiers_EXPORTS
        /* We are building this library */
#      define ITKMarkovRandomFieldsClassifiers_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKMarkovRandomFieldsClassifiers_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKMarkovRandomFieldsClassifiers_HIDDEN
#    define ITKMarkovRandomFieldsClassifiers_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKMARKOVRANDOMFIELDSCLASSIFIERS_DEPRECATED
#  define ITKMARKOVRANDOMFIELDSCLASSIFIERS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKMARKOVRANDOMFIELDSCLASSIFIERS_DEPRECATED_EXPORT
#  define ITKMARKOVRANDOMFIELDSCLASSIFIERS_DEPRECATED_EXPORT ITKMarkovRandomFieldsClassifiers_EXPORT ITKMARKOVRANDOMFIELDSCLASSIFIERS_DEPRECATED
#endif

#ifndef ITKMARKOVRANDOMFIELDSCLASSIFIERS_DEPRECATED_NO_EXPORT
#  define ITKMARKOVRANDOMFIELDSCLASSIFIERS_DEPRECATED_NO_EXPORT ITKMarkovRandomFieldsClassifiers_HIDDEN ITKMARKOVRANDOMFIELDSCLASSIFIERS_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKMARKOVRANDOMFIELDSCLASSIFIERS_NO_DEPRECATED
#    define ITKMARKOVRANDOMFIELDSCLASSIFIERS_NO_DEPRECATED
#  endif
#endif

#endif /* ITKMarkovRandomFieldsClassifiers_EXPORT_H */
