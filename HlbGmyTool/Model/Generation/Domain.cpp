// This file is part of HemeLB and is Copyright (C)
// the HemeLB team and/or their institutions, as detailed in the
// file AUTHORS. This software is provided under the terms of the
// license in the file LICENSE.

#include "Domain.h"
#include "Block.h"
#include "Debug.h"
#include "Site.h"

Domain::Domain(double OriginWorking[3],
               unsigned SiteCounts[3],
               unsigned BlockSize)
    : BlockSize(BlockSize), BlockWritingNum(0) {
  int remainder, totalBlocks = 1;

  for (unsigned int i = 0; i < 3; ++i) {
    // Copy in
    this->OriginWorking[i] = OriginWorking[i];

    this->SiteCounts[i] = SiteCounts[i];

    // Now work out how many blocks we require.
    this->BlockCounts[i] = this->SiteCounts[i] / BlockSize;
    remainder = this->SiteCounts[i] % BlockSize;
    if (remainder)
      ++this->BlockCounts[i];

    // Adjust the site count
    this->SiteCounts[i] = this->BlockCounts[i] * BlockSize;

    totalBlocks *= this->BlockCounts[i];
  }
  // Resize the block vector
  this->blocks.resize(totalBlocks);
  Log() << "Domain size " << this->BlockCounts << std::endl;

  this->blockWriters.resize(totalBlocks);
  
  this->blockready = new std::atomic<bool>[totalBlocks];

}

Vector Domain::CalcPositionWorkingFromIndex(const Index& index) const {
  Vector ans(index);
  ans += this->OriginWorking;
  return ans;
}

Block& Domain::GetBlock(const Index& index) {
  int i = this->TranslateIndex(index);
  Block* bp = this->blocks[i];
  // If the block hasn't been created yet, do so.
  if (!bp) {
    bp = this->blocks[i] = new Block(*this, index, this->BlockSize);
  }
  return *bp;
}

Site& Domain::GetSite(const Index& gIndex) {
  Block& block = this->GetBlock(gIndex / this->BlockSize);
  return block.GetSite(gIndex);
}

BlockIterator Domain::begin() {
  return BlockIterator(*this);
}

BlockIterator Domain::end() {
  return BlockIterator(*this, Index(this->BlockCounts[0], 0, 0));
}

BlockIterator::BlockIterator() : domain(NULL), current(0, 0, 0) {
  this->maxima = this->domain->BlockCounts - Index{1};
}

BlockIterator::BlockIterator(Domain& dom) : domain(&dom), current(0, 0, 0) {
  this->maxima = this->domain->BlockCounts - Index{1};
}

BlockIterator::BlockIterator(Domain& dom, const Index& start)
    : domain(&dom), current(start) {
  this->maxima = this->domain->BlockCounts - Index{1};
}

BlockIterator::BlockIterator(const BlockIterator& other)
    : domain(other.domain), current(other.current), maxima(other.maxima) {}
//	BlockIterator::~BlockIterator();

BlockIterator& BlockIterator::operator=(const BlockIterator& other) {
  if (this == &other) {
    return (*this);
  }
  this->domain = other.domain;
  this->current = other.current;
  this->maxima = other.maxima;

  return (*this);
}

BlockIterator& BlockIterator::operator++() {
  // Note it is an error to increment an iterator past it's end, so we don't
  // need to handle that case.
  int pos;

  // Update the index vector
  this->current[2] += 1;
  if (this->current[2] == this->domain->BlockCounts[2]) {
    this->current[2] = 0;

    this->current[1] += 1;
    if (this->current[1] == this->domain->BlockCounts[1]) {
      this->current[1] = 0;

      this->current[0] += 1;
    }
  }
  // print traversal order
  //Log() << "Traversing block " << this->current[0] << " " << this->current[1]
        //<< " " << this->current[2] << std::endl;
  return *this;
}

bool BlockIterator::operator==(const BlockIterator& other) const {
  return (other.domain == this->domain) && (other.current == this->current);
}

bool BlockIterator::operator!=(const BlockIterator& other) const {
  return !(*this == other);
}

BlockIterator::reference BlockIterator::operator*() {
  return this->domain->GetBlock(this->current);
}

BlockIterator::pointer BlockIterator::operator->() {
  return &(*(*this));
}
