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
%{
#include<Bnd_Array1OfBox.hxx>
#include<Bnd_Array1OfBox2d.hxx>
#include<Bnd_Array1OfSphere.hxx>
#include<Bnd_B2d.hxx>
#include<Bnd_B2f.hxx>
#include<Bnd_B3d.hxx>
#include<Bnd_B3f.hxx>
#include<Bnd_BoundSortBox.hxx>
#include<Bnd_BoundSortBox2d.hxx>
#include<Bnd_Box.hxx>
#include<Bnd_Box2d.hxx>
#include<Bnd_HArray1OfBox.hxx>
#include<Bnd_HArray1OfBox2d.hxx>
#include<Bnd_HArray1OfSphere.hxx>
#include<Bnd_Range.hxx>
#include<Bnd_SeqOfBox.hxx>
#include<Bnd_Sphere.hxx>
#include<Standard.hxx>
#include<Standard_Byte.hxx>
#include<Standard_GUID.hxx>
#include<Standard_MultiplyDefined.hxx>
#include<Standard_PCharacter.hxx>
#include<Standard_ImmutableObject.hxx>
#include<Standard_PErrorHandler.hxx>
#include<Standard_ExtCharacter.hxx>
#include<Standard_CString.hxx>
#include<Standard_NumericError.hxx>
#include<Standard_UUID.hxx>
#include<Standard_Assert.hxx>
#include<Standard_IStream.hxx>
#include<Standard_Macro.hxx>
#include<Standard_SStream.hxx>
#include<Standard_Integer.hxx>
#include<Standard_AbortiveTransaction.hxx>
#include<Standard_DomainError.hxx>
#include<Standard_NullValue.hxx>
#include<Standard_Underflow.hxx>
#include<Standard_PrimitiveTypes.hxx>
#include<Standard_Address.hxx>
#include<Standard_DimensionError.hxx>
#include<Standard_Time.hxx>
#include<Standard_OutOfRange.hxx>
#include<Standard_Stream.hxx>
#include<Standard_HandlerStatus.hxx>
#include<Standard_PExtCharacter.hxx>
#include<Standard_Overflow.hxx>
#include<Standard_NotImplemented.hxx>
#include<Standard_OStream.hxx>
#include<Standard_MMgrOpt.hxx>
#include<Standard_Size.hxx>
#include<Standard_ShortReal.hxx>
#include<Standard_Transient.hxx>
#include<Standard_Mutex.hxx>
#include<Standard_Atomic.hxx>
#include<Standard_Boolean.hxx>
#include<Standard_DefineException.hxx>
#include<Standard_math.hxx>
#include<Standard_Failure.hxx>
#include<Standard_MMgrRaw.hxx>
#include<Standard_ArrayStreamBuffer.hxx>
#include<Standard_DefineHandle.hxx>
#include<Standard_PByte.hxx>
#include<Standard_TypeMismatch.hxx>
#include<Standard_Version.hxx>
#include<Standard_LicenseNotFound.hxx>
#include<Standard_NoMoreObject.hxx>
#include<Standard_ExtString.hxx>
#include<Standard_NegativeValue.hxx>
#include<Standard_Type.hxx>
#include<Standard_Handle.hxx>
#include<Standard_MMgrTBBalloc.hxx>
#include<Standard_JmpBuf.hxx>
#include<Standard_ProgramError.hxx>
#include<Standard_NullObject.hxx>
#include<Standard_DefineAlloc.hxx>
#include<Standard_DivideByZero.hxx>
#include<Standard_TypeDef.hxx>
#include<Standard_DimensionMismatch.hxx>
#include<Standard_RangeError.hxx>
#include<Standard_OutOfMemory.hxx>
#include<Standard_ThreadId.hxx>
#include<Standard_MMgrRoot.hxx>
#include<Standard_ErrorHandler.hxx>
#include<Standard_NoSuchObject.hxx>
#include<Standard_TooManyUsers.hxx>
#include<Standard_LicenseError.hxx>
#include<Standard_Character.hxx>
#include<Standard_Real.hxx>
#include<Standard_ConstructionError.hxx>
#include<Standard_values.h>
#include<NCollection_Array1.hxx>
#include<NCollection_AccAllocator.hxx>
#include<NCollection_UtfString.hxx>
#include<NCollection_DefineHArray1.hxx>
#include<NCollection_Lerp.hxx>
#include<NCollection_DefineArray2.hxx>
#include<NCollection_DefineList.hxx>
#include<NCollection_DefineIndexedMap.hxx>
#include<NCollection_WinHeapAllocator.hxx>
#include<NCollection_Mat4.hxx>
#include<NCollection_AlignedAllocator.hxx>
#include<NCollection_DefineVector.hxx>
#include<NCollection_TypeDef.hxx>
#include<NCollection_Map.hxx>
#include<NCollection_BaseSequence.hxx>
#include<NCollection_LocalArray.hxx>
#include<NCollection_Comparator.hxx>
#include<NCollection_DefineMap.hxx>
#include<NCollection_HArray2.hxx>
#include<NCollection_TListNode.hxx>
#include<NCollection_DataMap.hxx>
#include<NCollection_DefineAlloc.hxx>
#include<NCollection_ListNode.hxx>
#include<NCollection_DefineDoubleMap.hxx>
#include<NCollection_DefineDataMap.hxx>
#include<NCollection_Vector.hxx>
#include<NCollection_DoubleMap.hxx>
#include<NCollection_UtfIterator.hxx>
#include<NCollection_DefineSequence.hxx>
#include<NCollection_HSequence.hxx>
#include<NCollection_Vec3.hxx>
#include<NCollection_UBTree.hxx>
#include<NCollection_EBTree.hxx>
#include<NCollection_DefineHArray2.hxx>
#include<NCollection_Vec4.hxx>
#include<NCollection_Handle.hxx>
#include<gp_XYZ.hxx>
#include<gp_XY.hxx>
#include<NCollection_CellFilter.hxx>
#include<NCollection_HArray1.hxx>
#include<NCollection_BaseList.hxx>
#include<NCollection_SparseArray.hxx>
#include<NCollection_DefineArray1.hxx>
#include<NCollection_BaseVector.hxx>
#include<NCollection_IncAllocator.hxx>
#include<NCollection_BaseAllocator.hxx>
#include<NCollection_SparseArrayBase.hxx>
#include<NCollection_IndexedMap.hxx>
#include<NCollection_Vec2.hxx>
#include<NCollection_List.hxx>
#include<NCollection_TListIterator.hxx>
#include<NCollection_BaseMap.hxx>
#include<NCollection_Buffer.hxx>
#include<NCollection_IndexedDataMap.hxx>
#include<NCollection_StdAllocator.hxx>
#include<NCollection_DefineHSequence.hxx>
#include<NCollection_UBTreeFiller.hxx>
#include<NCollection_DefineIndexedDataMap.hxx>
#include<NCollection_DefaultHasher.hxx>
#include<NCollection_String.hxx>
#include<NCollection_Sequence.hxx>
#include<NCollection_Array2.hxx>
#include<NCollection_Shared.hxx>
#include<NCollection_HeapAllocator.hxx>
#include<gp.hxx>
#include<gp_Pnt.hxx>
#include<gp_Lin.hxx>
#include<gp_XYZ.hxx>
#include<gp_Dir.hxx>
#include<gp_Vec2d.hxx>
#include<gp_Elips.hxx>
#include<gp_Trsf2d.hxx>
#include<gp_Pln.hxx>
#include<gp_Quaternion.hxx>
#include<gp_QuaternionSLerp.hxx>
#include<gp_Mat.hxx>
#include<gp_Parab2d.hxx>
#include<gp_QuaternionNLerp.hxx>
#include<gp_Ax2d.hxx>
#include<gp_Circ.hxx>
#include<gp_Ax2.hxx>
#include<gp_Torus.hxx>
#include<gp_VectorWithNullMagnitude.hxx>
#include<gp_TrsfForm.hxx>
#include<gp_Ax3.hxx>
#include<gp_TrsfNLerp.hxx>
#include<gp_Mat2d.hxx>
#include<gp_Elips2d.hxx>
#include<gp_Pnt2d.hxx>
#include<gp_Ax22d.hxx>
#include<gp_EulerSequence.hxx>
#include<gp_Lin2d.hxx>
#include<gp_XY.hxx>
#include<gp_Cone.hxx>
#include<gp_Trsf.hxx>
#include<gp_Sphere.hxx>
#include<gp_GTrsf.hxx>
#include<gp_Dir2d.hxx>
#include<gp_Vec.hxx>
#include<gp_Parab.hxx>
#include<gp_Ax1.hxx>
#include<gp_Circ2d.hxx>
#include<gp_Hypr.hxx>
#include<gp_Hypr2d.hxx>
#include<gp_Cylinder.hxx>
#include<gp_GTrsf2d.hxx>
#include<TColStd_Array2OfBoolean.hxx>
#include<TColStd_HArray1OfExtendedString.hxx>
#include<TColStd_HArray2OfBoolean.hxx>
#include<TColStd_HArray1OfCharacter.hxx>
#include<TColStd_HSequenceOfHAsciiString.hxx>
#include<TColStd_HArray1OfBoolean.hxx>
#include<TColStd_DataMapOfIntegerTransient.hxx>
#include<TColStd_ListOfInteger.hxx>
#include<TColStd_SequenceOfAddress.hxx>
#include<TColStd_DataMapOfIntegerInteger.hxx>
#include<TColStd_HArray2OfTransient.hxx>
#include<TColStd_Array2OfCharacter.hxx>
#include<TColStd_HArray1OfAsciiString.hxx>
#include<TColStd_MapIteratorOfMapOfInteger.hxx>
#include<TColStd_ListIteratorOfListOfTransient.hxx>
#include<TColStd_IndexedMapOfTransient.hxx>
#include<TColStd_Array1OfReal.hxx>
#include<TColStd_HSequenceOfTransient.hxx>
#include<TColStd_HSequenceOfAsciiString.hxx>
#include<TColStd_MapIteratorOfPackedMapOfInteger.hxx>
#include<TColStd_MapOfInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerTransient.hxx>
#include<TColStd_SequenceOfAsciiString.hxx>
#include<TColStd_MapIteratorOfMapOfTransient.hxx>
#include<TColStd_Array1OfByte.hxx>
#include<TColStd_ListOfAsciiString.hxx>
#include<TColStd_MapIteratorOfMapOfReal.hxx>
#include<TColStd_Array2OfReal.hxx>
#include<TColStd_MapOfTransient.hxx>
#include<TColStd_ListOfTransient.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerReal.hxx>
#include<TColStd_HArray1OfReal.hxx>
#include<TColStd_SequenceOfTransient.hxx>
#include<TColStd_SequenceOfInteger.hxx>
#include<TColStd_Array1OfBoolean.hxx>
#include<TColStd_SequenceOfBoolean.hxx>
#include<TColStd_HArray1OfInteger.hxx>
#include<TColStd_DataMapOfTransientTransient.hxx>
#include<TColStd_Array1OfListOfInteger.hxx>
#include<TColStd_Array2OfInteger.hxx>
#include<TColStd_PackedMapOfInteger.hxx>
#include<TColStd_SequenceOfHExtendedString.hxx>
#include<TColStd_IndexedDataMapOfStringString.hxx>
#include<TColStd_ListIteratorOfListOfInteger.hxx>
#include<TColStd_SequenceOfReal.hxx>
#include<TColStd_MapOfReal.hxx>
#include<TColStd_HSequenceOfHExtendedString.hxx>
#include<TColStd_MapIteratorOfMapOfAsciiString.hxx>
#include<TColStd_ListOfReal.hxx>
#include<TColStd_MapIntegerHasher.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger.hxx>
#include<TColStd_Array1OfInteger.hxx>
#include<TColStd_Array2OfTransient.hxx>
#include<TColStd_DataMapOfIntegerReal.hxx>
#include<TColStd_DataMapOfIntegerListOfInteger.hxx>
#include<TColStd_HArray2OfReal.hxx>
#include<TColStd_HArray1OfListOfInteger.hxx>
#include<TColStd_HPackedMapOfInteger.hxx>
#include<TColStd_IndexedMapOfInteger.hxx>
#include<TColStd_ListIteratorOfListOfAsciiString.hxx>
#include<TColStd_MapTransientHasher.hxx>
#include<TColStd_HSequenceOfInteger.hxx>
#include<TColStd_SequenceOfExtendedString.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger.hxx>
#include<TColStd_HArray1OfTransient.hxx>
#include<TColStd_HArray2OfInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfTransientTransient.hxx>
#include<TColStd_IndexedDataMapOfTransientTransient.hxx>
#include<TColStd_Array1OfTransient.hxx>
#include<TColStd_HSequenceOfExtendedString.hxx>
#include<TColStd_SequenceOfHAsciiString.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfStringInteger.hxx>
#include<TColStd_Array1OfCharacter.hxx>
#include<TColStd_HArray2OfCharacter.hxx>
#include<TColStd_Array1OfAsciiString.hxx>
#include<TColStd_MapOfAsciiString.hxx>
#include<TColStd_MapRealHasher.hxx>
#include<TColStd_DataMapOfStringInteger.hxx>
#include<TColStd_IndexedMapOfReal.hxx>
#include<TColStd_HArray1OfByte.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerInteger.hxx>
#include<TColStd_HSequenceOfReal.hxx>
#include<TColStd_Array1OfExtendedString.hxx>
#include<TColStd_DataMapOfAsciiStringInteger.hxx>
#include<TColStd_ListIteratorOfListOfReal.hxx>
#include<TColgp_Array2OfXYZ.hxx>
#include<TColgp_SequenceOfVec.hxx>
#include<TColgp_Array1OfCirc2d.hxx>
#include<TColgp_Array1OfLin2d.hxx>
#include<TColgp_SequenceOfPnt2d.hxx>
#include<TColgp_HArray2OfLin2d.hxx>
#include<TColgp_HArray2OfVec.hxx>
#include<TColgp_HSequenceOfXY.hxx>
#include<TColgp_SequenceOfVec2d.hxx>
#include<TColgp_HArray1OfVec.hxx>
#include<TColgp_HArray2OfCirc2d.hxx>
#include<TColgp_HArray2OfPnt2d.hxx>
#include<TColgp_Array1OfDir.hxx>
#include<TColgp_SequenceOfPnt.hxx>
#include<TColgp_HArray2OfDir2d.hxx>
#include<TColgp_Array1OfPnt2d.hxx>
#include<TColgp_HSequenceOfPnt2d.hxx>
#include<TColgp_HArray1OfXY.hxx>
#include<TColgp_HArray1OfCirc2d.hxx>
#include<TColgp_Array1OfDir2d.hxx>
#include<TColgp_SequenceOfDir2d.hxx>
#include<TColgp_Array2OfVec2d.hxx>
#include<TColgp_Array2OfXY.hxx>
#include<TColgp_Array2OfLin2d.hxx>
#include<TColgp_HSequenceOfPnt.hxx>
#include<TColgp_HSequenceOfXYZ.hxx>
#include<TColgp_HArray1OfPnt2d.hxx>
#include<TColgp_SequenceOfXY.hxx>
#include<TColgp_Array1OfXYZ.hxx>
#include<TColgp_HSequenceOfVec2d.hxx>
#include<TColgp_Array2OfPnt2d.hxx>
#include<TColgp_HArray2OfDir.hxx>
#include<TColgp_Array1OfVec2d.hxx>
#include<TColgp_SequenceOfAx1.hxx>
#include<TColgp_SequenceOfDir.hxx>
#include<TColgp_HSequenceOfDir2d.hxx>
#include<TColgp_HArray1OfDir.hxx>
#include<TColgp_HArray2OfPnt.hxx>
#include<TColgp_HArray1OfLin2d.hxx>
#include<TColgp_HArray1OfPnt.hxx>
#include<TColgp_HArray2OfVec2d.hxx>
#include<TColgp_HArray2OfXYZ.hxx>
#include<TColgp_SequenceOfArray1OfPnt2d.hxx>
#include<TColgp_HSequenceOfVec.hxx>
#include<TColgp_HSequenceOfDir.hxx>
#include<TColgp_Array1OfVec.hxx>
#include<TColgp_HArray2OfXY.hxx>
#include<TColgp_Array2OfPnt.hxx>
#include<TColgp_Array2OfVec.hxx>
#include<TColgp_Array2OfCirc2d.hxx>
#include<TColgp_HArray1OfXYZ.hxx>
#include<TColgp_Array1OfXY.hxx>
#include<TColgp_Array2OfDir2d.hxx>
#include<TColgp_Array1OfPnt.hxx>
#include<TColgp_SequenceOfXYZ.hxx>
#include<TColgp_HArray1OfVec2d.hxx>
#include<TColgp_HArray1OfDir2d.hxx>
#include<TColgp_Array2OfDir.hxx>
#include<TColStd_Array2OfBoolean.hxx>
#include<TColStd_HArray1OfExtendedString.hxx>
#include<TColStd_HArray2OfBoolean.hxx>
#include<TColStd_HArray1OfCharacter.hxx>
#include<TColStd_HSequenceOfHAsciiString.hxx>
#include<TColStd_HArray1OfBoolean.hxx>
#include<TColStd_DataMapOfIntegerTransient.hxx>
#include<TColStd_ListOfInteger.hxx>
#include<TColStd_SequenceOfAddress.hxx>
#include<TColStd_DataMapOfIntegerInteger.hxx>
#include<TColStd_HArray2OfTransient.hxx>
#include<TColStd_Array2OfCharacter.hxx>
#include<TColStd_HArray1OfAsciiString.hxx>
#include<TColStd_MapIteratorOfMapOfInteger.hxx>
#include<TColStd_ListIteratorOfListOfTransient.hxx>
#include<TColStd_IndexedMapOfTransient.hxx>
#include<TColStd_Array1OfReal.hxx>
#include<TColStd_HSequenceOfTransient.hxx>
#include<TColStd_HSequenceOfAsciiString.hxx>
#include<TColStd_MapIteratorOfPackedMapOfInteger.hxx>
#include<TColStd_MapOfInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerTransient.hxx>
#include<TColStd_SequenceOfAsciiString.hxx>
#include<TColStd_MapIteratorOfMapOfTransient.hxx>
#include<TColStd_Array1OfByte.hxx>
#include<TColStd_ListOfAsciiString.hxx>
#include<TColStd_MapIteratorOfMapOfReal.hxx>
#include<TColStd_Array2OfReal.hxx>
#include<TColStd_MapOfTransient.hxx>
#include<TColStd_ListOfTransient.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerReal.hxx>
#include<TColStd_HArray1OfReal.hxx>
#include<TColStd_SequenceOfTransient.hxx>
#include<TColStd_SequenceOfInteger.hxx>
#include<TColStd_Array1OfBoolean.hxx>
#include<TColStd_SequenceOfBoolean.hxx>
#include<TColStd_HArray1OfInteger.hxx>
#include<TColStd_DataMapOfTransientTransient.hxx>
#include<TColStd_Array1OfListOfInteger.hxx>
#include<TColStd_Array2OfInteger.hxx>
#include<TColStd_PackedMapOfInteger.hxx>
#include<TColStd_SequenceOfHExtendedString.hxx>
#include<TColStd_IndexedDataMapOfStringString.hxx>
#include<TColStd_ListIteratorOfListOfInteger.hxx>
#include<TColStd_SequenceOfReal.hxx>
#include<TColStd_MapOfReal.hxx>
#include<TColStd_HSequenceOfHExtendedString.hxx>
#include<TColStd_MapIteratorOfMapOfAsciiString.hxx>
#include<TColStd_ListOfReal.hxx>
#include<TColStd_MapIntegerHasher.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger.hxx>
#include<TColStd_Array1OfInteger.hxx>
#include<TColStd_Array2OfTransient.hxx>
#include<TColStd_DataMapOfIntegerReal.hxx>
#include<TColStd_DataMapOfIntegerListOfInteger.hxx>
#include<TColStd_HArray2OfReal.hxx>
#include<TColStd_HArray1OfListOfInteger.hxx>
#include<TColStd_HPackedMapOfInteger.hxx>
#include<TColStd_IndexedMapOfInteger.hxx>
#include<TColStd_ListIteratorOfListOfAsciiString.hxx>
#include<TColStd_MapTransientHasher.hxx>
#include<TColStd_HSequenceOfInteger.hxx>
#include<TColStd_SequenceOfExtendedString.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger.hxx>
#include<TColStd_HArray1OfTransient.hxx>
#include<TColStd_HArray2OfInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfTransientTransient.hxx>
#include<TColStd_IndexedDataMapOfTransientTransient.hxx>
#include<TColStd_Array1OfTransient.hxx>
#include<TColStd_HSequenceOfExtendedString.hxx>
#include<TColStd_SequenceOfHAsciiString.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfStringInteger.hxx>
#include<TColStd_Array1OfCharacter.hxx>
#include<TColStd_HArray2OfCharacter.hxx>
#include<TColStd_Array1OfAsciiString.hxx>
#include<TColStd_MapOfAsciiString.hxx>
#include<TColStd_MapRealHasher.hxx>
#include<TColStd_DataMapOfStringInteger.hxx>
#include<TColStd_IndexedMapOfReal.hxx>
#include<TColStd_HArray1OfByte.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerInteger.hxx>
#include<TColStd_HSequenceOfReal.hxx>
#include<TColStd_Array1OfExtendedString.hxx>
#include<TColStd_DataMapOfAsciiStringInteger.hxx>
#include<TColStd_ListIteratorOfListOfReal.hxx>
#include<TCollection.hxx>
#include<TCollection_ExtendedString.hxx>
#include<TCollection_BasicMap.hxx>
#include<TCollection_BasicMapIterator.hxx>
#include<TCollection_MapNodePtr.hxx>
#include<TCollection_Side.hxx>
#include<TCollection_HExtendedString.hxx>
#include<TCollection_SeqNodePtr.hxx>
#include<TCollection_BaseSequence.hxx>
#include<TCollection_MapNode.hxx>
#include<TCollection_HAsciiString.hxx>
#include<TCollection_SeqNode.hxx>
#include<TCollection_AsciiString.hxx>
#include<Storage.hxx>
#include<Storage_BucketOfPersistent.hxx>
#include<Storage_SolveMode.hxx>
#include<Storage_RootData.hxx>
#include<Storage_HArrayOfSchema.hxx>
#include<Storage_TypeData.hxx>
#include<Storage_Root.hxx>
#include<Storage_PType.hxx>
#include<Storage_Error.hxx>
#include<Storage_Schema.hxx>
#include<Storage_PArray.hxx>
#include<Storage_StreamTypeMismatchError.hxx>
#include<Storage_StreamExtCharParityError.hxx>
#include<Storage_DataMapIteratorOfMapOfPers.hxx>
#include<Storage_stCONSTclCOM.hxx>
#include<Storage_ArrayOfCallBack.hxx>
#include<Storage_MapOfPers.hxx>
#include<Storage_DefaultCallBack.hxx>
#include<Storage_HPArray.hxx>
#include<Storage_Macros.hxx>
#include<Storage_OpenMode.hxx>
#include<Storage_HSeqOfRoot.hxx>
#include<Storage_TypedCallBack.hxx>
#include<Storage_StreamFormatError.hxx>
#include<Storage_StreamModeError.hxx>
#include<Storage_StreamReadError.hxx>
#include<Storage_CallBack.hxx>
#include<Storage_Position.hxx>
#include<Storage_HArrayOfCallBack.hxx>
#include<Storage_MapOfCallBack.hxx>
#include<Storage_StreamWriteError.hxx>
#include<Storage_DataMapIteratorOfMapOfCallBack.hxx>
#include<Storage_HeaderData.hxx>
#include<Storage_ArrayOfSchema.hxx>
#include<Storage_SeqOfRoot.hxx>
#include<Storage_BaseDriver.hxx>
#include<Storage_InternalData.hxx>
#include<Storage_Data.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import TColStd.i
