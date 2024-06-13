
#ifndef ITKSpatialObjects_EXPORT_H
#define ITKSpatialObjects_EXPORT_H

#ifdef ITK_STATIC
#  define ITKSpatialObjects_EXPORT
#  define ITKSpatialObjects_HIDDEN
#else
#  ifndef ITKSpatialObjects_EXPORT
#    ifdef ITKSpatialObjects_EXPORTS
        /* We are building this library */
#      define ITKSpatialObjects_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define ITKSpatialObjects_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef ITKSpatialObjects_HIDDEN
#    define ITKSpatialObjects_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef ITKSPATIALOBJECTS_DEPRECATED
#  define ITKSPATIALOBJECTS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ITKSPATIALOBJECTS_DEPRECATED_EXPORT
#  define ITKSPATIALOBJECTS_DEPRECATED_EXPORT ITKSpatialObjects_EXPORT ITKSPATIALOBJECTS_DEPRECATED
#endif

#ifndef ITKSPATIALOBJECTS_DEPRECATED_NO_EXPORT
#  define ITKSPATIALOBJECTS_DEPRECATED_NO_EXPORT ITKSpatialObjects_HIDDEN ITKSPATIALOBJECTS_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef ITKSPATIALOBJECTS_NO_DEPRECATED
#    define ITKSPATIALOBJECTS_NO_DEPRECATED
#  endif
#endif

#endif /* ITKSpatialObjects_EXPORT_H */
