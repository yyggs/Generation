/*=========================================================================
 *
 *  Copyright NumFOCUS
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0.txt
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 *=========================================================================*/
#ifndef GDCMQUERYSERIES_H
#define GDCMQUERYSERIES_H

#include "gdcmQueryBase.h"

namespace gdcm
{
/**
 * \brief QuerySeries
 * \details contains: class to construct a series-based query for c-find and c-move
 */
class GDCM_EXPORT QuerySeries : public QueryBase
{
public:
  std::vector<Tag> GetRequiredTags(const ERootType& inRootType) const override;
  std::vector<Tag> GetUniqueTags(const ERootType& inRootType) const override;
  std::vector<Tag> GetOptionalTags(const ERootType& inRootType) const override;
  std::vector<Tag> GetHierachicalSearchTags(const ERootType& inRootType) const override;

  const char * GetName() const override;
  DataElement GetQueryLevel() const override;
};

} // end namespace gdcm

#endif //GDCMQUERYSERIES_H
