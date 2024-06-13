// This file is part of HemeLB and is Copyright (C)
// the HemeLB team and/or their institutions, as detailed in the
// file AUTHORS. This software is provided under the terms of the
// license in the file LICENSE.

#ifndef HEMELBSETUPTOOL_GENERATIONERROR_H
#define HEMELBSETUPTOOL_GENERATIONERROR_H
#include <exception>
#include <string>

struct GenerationError : public std::exception {
  virtual const char* what() const noexcept { return "GenerationError"; }
};

struct GenerationErrorMessage : public GenerationError {
  GenerationErrorMessage(const std::string errorMessage) : msg(errorMessage) {}
  ~GenerationErrorMessage() {}
  virtual const char* what() const noexcept { return msg.c_str(); }

  const std::string msg;
};

#endif
