// This file is part of HemeLB and is Copyright (C)
// the HemeLB team and/or their institutions, as detailed in the
// file AUTHORS. This software is provided under the terms of the
// license in the file LICENSE.

#ifndef HEMELBSETUPTOOL_BLOCK_H
#define HEMELBSETUPTOOL_BLOCK_H

#include <vtkSmartPointer.h>
#include <vector>

class vtkOBBTree;

#include "Index.h"
#include "Site.h"
#include "Domain.h"
#include "Debug.h"

using SiteVec = std::vector<Site>;

class Block{
  public:
    Block(Domain& domain, const Index& ind, const unsigned int& size);
    ~Block();  

    class InnerSiteIterator {
      Block& block;
      unsigned int index;

    public:
      using iterator_category = std::forward_iterator_tag;
      using value_type = Site;
      using difference_type = std::ptrdiff_t;
      using pointer = Site*;
      using reference = Site&;

      InnerSiteIterator(Block& block, unsigned int start = 0)
        : block(block), index(start) {
        if(index < block.sites.size() && block.sites[index].IsHalo){
          ++(*this);
        }
      }

      InnerSiteIterator& operator++() {
        do {
          ++index;
        } while(index < block.sites.size() && block.sites[index].IsHalo);
        return *this;
      }

      reference operator*() const {
          return block.sites[index];
      }

      pointer operator->() const {
          return &block.sites[index];
      }

      bool operator==(const InnerSiteIterator& other) const {
          return index == other.index;
      }

      bool operator!=(const InnerSiteIterator& other) const {
          return index != other.index;
      }
    };

    Site& GetSite(const Index& globalInd){
      Index localInd = globalInd - min + Index{1};
      return this->sites[localInd[0] * (size + 2) * (size + 2) + localInd[1] * (size + 2) + localInd[2]];
    }

    InnerSiteIterator begin() {
      return InnerSiteIterator(*this);
    }

    InnerSiteIterator end() {
      return InnerSiteIterator(*this, sites.size());
    }

    inline Domain& GetDomain() const { return this->domain; }
    inline const Index& GetIndex() const { return this->index; }
    vtkSmartPointer<vtkOBBTree> CreateOBBTreeModel(double extraSize) const;

    const Site& Middle() const { return sites[sites.size() / 2]; }

  protected:
    Domain& domain;
    const Index index;
    const unsigned int size;
    const Index min;
    const Index max;
    public:
    SiteVec sites;

    inline unsigned int TranslateIndex(const Index& ind) {
      return (ind[0] * this->size + ind[1]) * this->size + ind[2];
    }
    friend class NeighbourIteratorBase;
    friend class LaterNeighbourIterator;
    friend class InnerSiteIterator;
};



#endif  // HEMELBSETUPTOOL_BLOCK_H
