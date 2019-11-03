/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- time : 2019-11-03 11:38:13
- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define BVHDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=BVHDOCSTRING) BVH

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%include BVH_headers.i


%include "BVH_Box.hxx";
%include "BVH_PrimitiveSet.hxx";
/* public enums */
enum  {
	BVH_Constants_MaxTreeDepth = 32,
	BVH_Constants_LeafNodeSizeSingle = 1,
	BVH_Constants_LeafNodeSizeAverage = 4,
	BVH_Constants_LeafNodeSizeDefault = 5,
	BVH_Constants_LeafNodeSizeSmall = 8,
	BVH_Constants_NbBinsOptimal = 32,
	BVH_Constants_NbBinsBest = 48,
};

/* end public enums declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef BVH_PrimitiveSet <Standard_Real , 3> BVH_PrimitiveSet3d;
typedef std::pair <Standard_Integer , Standard_Integer> BVH_EncodedLink;
typedef BVH::VectorType <Standard_Integer , 2>::Type BVH_Vec2i;
typedef BVH::VectorType <Standard_Integer , 3>::Type BVH_Vec3i;
typedef BVH::VectorType <Standard_Integer , 4>::Type BVH_Vec4i;
typedef BVH::ArrayType <Standard_Integer , 2>::Type BVH_Array2i;
typedef BVH::ArrayType <Standard_Integer , 3>::Type BVH_Array3i;
typedef BVH::ArrayType <Standard_Integer , 4>::Type BVH_Array4i;
typedef BVH::VectorType <Standard_ShortReal , 2>::Type BVH_Vec2f;
typedef BVH::VectorType <Standard_ShortReal , 3>::Type BVH_Vec3f;
typedef BVH::VectorType <Standard_ShortReal , 4>::Type BVH_Vec4f;
typedef BVH::ArrayType <Standard_ShortReal , 2>::Type BVH_Array2f;
typedef BVH::ArrayType <Standard_ShortReal , 3>::Type BVH_Array3f;
typedef BVH::ArrayType <Standard_ShortReal , 4>::Type BVH_Array4f;
typedef BVH::VectorType <Standard_Real , 2>::Type BVH_Vec2d;
typedef BVH::VectorType <Standard_Real , 3>::Type BVH_Vec3d;
typedef BVH::VectorType <Standard_Real , 4>::Type BVH_Vec4d;
typedef BVH::ArrayType <Standard_Real , 2>::Type BVH_Array2d;
typedef BVH::ArrayType <Standard_Real , 3>::Type BVH_Array3d;
typedef BVH::ArrayType <Standard_Real , 4>::Type BVH_Array4d;
typedef BVH::MatrixType <Standard_ShortReal , 4>::Type BVH_Mat4f;
typedef BVH::MatrixType <Standard_Real , 4>::Type BVH_Mat4d;
typedef typename BVH_QueueBuilder <T , N>::BVH_PrimitiveRange Range;
/* end typedefs declaration */

/* harray1 class */
/* harray2 class */
/* harray2 class */