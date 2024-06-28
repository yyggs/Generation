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
using SiteIterator = SiteVec::iterator;

class Block {
 public:
  Block(Domain&, const Index&, const unsigned int&);
  ~Block();

  Site& GetGlobalSite(const Index&);
  virtual Site& GetLocalSite(const Index&);

  inline SiteIterator begin() { return this->sites.begin(); }

  inline SiteIterator end() { return this->sites.end(); }

  inline Domain& GetDomain() const { return this->domain; }
  inline const Index& GetIndex() const { return this->index; }
  vtkSmartPointer<vtkOBBTree> CreateOBBTreeModel(double extraSize) const;

  const Site& Middle() const { return sites[sites.size() / 2]; }

 protected:
  unsigned int size;
  const Index index;
  const Index min;
  const Index max;
  Domain& domain;
  SiteVec sites;

  inline unsigned int TranslateIndex(const Index& ind) {
    return (ind[0] * this->size + ind[1]) * this->size + ind[2];
  }
  friend class NeighbourIteratorBase;
  friend class LaterNeighbourIterator;
};

class HaloBlock : public Block {
  public:
    HaloBlock(Domain& domain, const Index& ind, const unsigned int& size)
      : Block(domain, ind, size) {
      for(int i = 0; i < (size + 2) * (size + 2) * (size + 2) - size * size * size; i++){
        Index index = haloIntIndexMap[i] + min;
        haloSites.emplace_back(*this, index);
      }
    }
    ~HaloBlock();

    Site& GetLocalSite(const Index& globalInd){
      bool local = true;
      for (unsigned int i = 0; i < 3; ++i) {
        if (globalInd[i] < this->min[i] || globalInd[i] >= this->max[i]) {
          local = false;
          break;
        }
      }
      if (local)
        return this->Block::GetLocalSite(globalInd - this->min);

      // Check if the coords belong to halo
      auto it = haloIndexIntMap.find(globalInd - min);
      if (it != haloIndexIntMap.end()) {
          return this->haloSites[it->second];
      } else {
          Log() << "Error: HaloBlock::GetLocalSite: site not found in halo" << std::endl;
          std::exit(1);
      }
    }

    // Create the map between the index of the sites and the 3D index of the halos
    // const ??
    static void CreateHaloMap(){
      int ijk = 0;
      for(int i = 0; i < 10; i++){
        for(int j = 0; j < 10; j++){
          for(int k = 0; k < 10; k++){
            if(k == 0 || k == 9 || j == 0 || j == 9 || i == 0 || i == 9){
              Index ind = Index(i-1, j-1, k-1);
              haloIndexIntMap[ind] = ijk;
              haloIntIndexMap[ijk] = ind;
              ijk++;
              //Log() << "haloIndexIntMap[" << ind << "] = " << haloIndexIntMap[ind] << std::endl;
            }
          }
        }
      }
    }

  private:
    SiteVec haloSites;
    static std::unordered_map<Index, unsigned int> haloIndexIntMap;
    static std::unordered_map<unsigned int, Index> haloIntIndexMap;
};

class UnifiedBlock{
  public:
    UnifiedBlock(Domain& domain, const Index& ind, const unsigned int& size);
    ~UnifiedBlock();  

    Site& GetSite(const Index& globalInd){
      Index localInd = globalInd - min - Index{1};
      return this->sites[localInd[0] * (size + 2) * (size + 2) + localInd[1] * (size + 2) + localInd[2]];
    }

    class InnerSiteIterator {
      UnifiedBlock& block;
      unsigned int index;

    public:
      using iterator_category = std::forward_iterator_tag;
      using value_type = Site;
      using difference_type = std::ptrdiff_t;
      using pointer = Site*;
      using reference = Site&;

      InnerSiteIterator(UnifiedBlock& block, unsigned int start = 0)
        : block(block), index(start) {
        if(index < block.sites.size() && !isInnerIndex()){
          ++(*this);
        }
      }

      bool isInnerIndex() const {
        int z = index % (block.size + 2);
        int y = (index / (block.size + 2)) % (block.size + 2);
        int x = index / ((block.size + 2) * (block.size + 2));
        return x > 0 && x < block.size + 1 && y > 0 && y < block.size + 1 && z > 0 && z < block.size + 1;
      }

      InnerSiteIterator& operator++() {
        do {
          ++index;
        } while(index < block.sites.size() && !isInnerIndex());
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
    SiteVec sites;

    inline unsigned int TranslateIndex(const Index& ind) {
      return (ind[0] * this->size + ind[1]) * this->size + ind[2];
    }
    friend class NeighbourIteratorBase;
    friend class LaterNeighbourIterator;
};


#endif  // HEMELBSETUPTOOL_BLOCK_H
