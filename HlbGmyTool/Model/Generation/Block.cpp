// This file is part of HemeLB and is Copyright (C)
// the HemeLB team and/or their institutions, as detailed in the
// file AUTHORS. This software is provided under the terms of the
// license in the file LICENSE.

#include "Index.h"

#include "Block.h"
#include "Domain.h"
#include "Site.h"

#include "vtkCubeSource.h"
#include "vtkOBBTree.h"
#include "vtkXMLPolyDataWriter.h"
#include "Debug.h"

/*
 * Helper functions to check if sites are on the edge of the Domain.
 */
bool _CheckMin(const Index& ind) {
  if (ind[0] == 0 || ind[1] == 0 || ind[2] == 0)
    return true;
  return false;
}
bool _CheckMax(const Index& ind, const Index& max) {
  if (ind[0] == max[0] || ind[1] == max[1] || ind[2] == max[2])
    return true;
  return false;
}
bool BlockHasEdges(const Block& block) {
  const Index& ind = block.GetIndex();
  if (_CheckMin(ind))
    return true;

  if (_CheckMax(ind, block.GetDomain().GetBlockCounts() - Index{1}))
    return true;
  return false;
}
bool SiteIsEdge(const Site& site) {
  const Index& ind = site.GetIndex();
  if (_CheckMin(ind))
    return true;

  if (_CheckMax(ind, site.GetBlock().GetDomain().GetSiteCounts() - Index{1}))
    return true;
  return false;
}

vtkSmartPointer<vtkOBBTree> Block::CreateOBBTreeModel(double extraSize) const {
  // Create an OBB Tree which is a cube slightly bigger than this block
  vtkNew<vtkOBBTree> result;
  vtkNew<vtkCubeSource> cubeSource;

  cubeSource->SetBounds(sites.front().Position[0] - extraSize,
                        sites.back().Position[0] + extraSize,
                        sites.front().Position[1] - extraSize,
                        sites.back().Position[1] + extraSize,
                        sites.front().Position[2] - extraSize,
                        sites.back().Position[2] + extraSize);


  vtkNew<vtkPolyData> cubePolyData;
  cubeSource->SetOutput(cubePolyData);
  cubeSource->Update();

  result->SetDataSet(cubePolyData);
  result->BuildLocator();
  return result;
}

Block::~Block() {
  
}

Block::Block(Domain& domain, const Index& ind, const unsigned int& size)
      : domain(domain), index(ind), size(size), min(ind * size), max((ind + Index{1}) * size) {
    //this->sites.reserve((size + 2) * (size + 2) * (size + 2));
    unsigned int ijk = 0;
    const bool blockHasEdge = BlockHasEdges(*this);

    for (int i = ind[0] * size; i < (ind[0] + 1) * size + 2; ++i) {
      for (int j = ind[1] * size; j < (ind[1] + 1) * size + 2; ++j) {
        for (int k = ind[2] * size; k < (ind[2] + 1) * size + 2; ++k) {  
          Index index(i-1, j-1, k-1);
          this->sites.emplace_back(*this, index);    
                  
          // Check if the site is on the halo of the block
          if(i == ind[0] * size || j == ind[1] * size || k == ind[2] * size || i == (ind[0] + 1) * size + 1 || j == (ind[1] + 1) * size + 1 || k == (ind[2] + 1) * size + 1){
            this->sites[ijk].IsHalo = true;
          }
          /*
          * If the site is on the edge of the domain, we known that it
          * must be solid. Set this here in order to bootstrap the
          * classification process.
          */
          else if (blockHasEdge && SiteIsEdge(this->sites[ijk])) {
            this->sites[ijk].IsFluidKnown = true;
            this->sites[ijk].IsFluid = false;
          }

          ++ijk;
        }
      }
    }
  }