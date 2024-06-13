// Copyright(C) 1999-2020 National Technology & Engineering Solutions
// of Sandia, LLC (NTESS).  Under the terms of Contract DE-NA0003525 with
// NTESS, the U.S. Government retains certain rights in this software.
//
// See packages/seacas/LICENSE for details

#ifndef __exodusII_cfg_h
#define __exodusII_cfg_h

#if defined(_WIN32) && !defined(WIN32)
# define WIN32
#endif

#define EXODUSII_BUILD_SHARED_LIBS
#if defined(WIN32) && defined(EXODUSII_BUILD_SHARED_LIBS)
#  if defined(exoIIc_EXPORTS)
#    define EXODUS_EXPORT __declspec( dllexport ) extern
#  else
#    define EXODUS_EXPORT __declspec( dllimport ) extern
#  endif
#else
#  define EXODUS_EXPORT extern
#endif

#endif

