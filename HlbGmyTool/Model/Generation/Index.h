// This file is part of HemeLB and is Copyright (C)
// the HemeLB team and/or their institutions, as detailed in the
// file AUTHORS. This software is provided under the terms of the
// license in the file LICENSE.

#ifndef HEMELBSETUPTOOL_INDEX_H
#define HEMELBSETUPTOOL_INDEX_H

#include <exception>
#include "util/Vector3D.h"
#include <functional>

class IndexError : public std::exception {
 public:
  virtual const char* what() const noexcept { return "IndexError"; }
};

typedef hemelb::util::Vector3D<int> Index;
typedef hemelb::util::Vector3D<double> Vector;

namespace std {

template <>
struct hash<hemelb::util::Vector3D<int>> {
    std::size_t operator()(const hemelb::util::Vector3D<int>& v) const noexcept {
        std::size_t hx = std::hash<int>()(v[0]);
        std::size_t hy = std::hash<int>()(v[1]);
        std::size_t hz = std::hash<int>()(v[2]);
        return hx ^ (hy << 1) ^ (hz << 2);
    }
};

}  // namespace std

#endif  // HEMELBSETUPTOOL_INDEX_H
