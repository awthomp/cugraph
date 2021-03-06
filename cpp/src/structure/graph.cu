 /*
 * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
 *
 * NVIDIA CORPORATION and its licensors retain all intellectual property
 * and proprietary rights in and to this software, related documentation
 * and any modifications thereto.  Any use, reproduction, disclosure or
 * distribution of this software and related documentation without an express
 * license agreement from NVIDIA CORPORATION is strictly prohibited.
 *
 */

#include <graph.hpp>
#include "utilities/graph_utils.cuh"
#include "utilities/error_utils.h"

namespace cugraph {
namespace experimental {

template <typename VT, typename ET, typename WT>
void GraphCompressedSparseBase<VT,ET,WT>::get_vertex_identifiers(VT *identifiers) const {
  CUGRAPH_EXPECTS( offsets != nullptr , "No graph specified");
  cugraph::detail::sequence<VT>(GraphBase<VT,ET,WT>::number_of_vertices, identifiers);
}

template <typename VT, typename ET, typename WT>
void GraphCompressedSparseBase<VT,ET,WT>::get_source_indices(VT *src_indices) const {
  CUGRAPH_EXPECTS( offsets != nullptr , "No graph specified");
  cugraph::detail::offsets_to_indices<VT>(offsets, GraphBase<VT,ET,WT>::number_of_vertices, src_indices);
}

// explicit instantiation
template class GraphCompressedSparseBase<int32_t,int32_t,float>;
template class GraphCompressedSparseBase<int32_t,int32_t,double>;

}
}
