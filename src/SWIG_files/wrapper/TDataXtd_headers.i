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
#include<TDataXtd.hxx>
#include<TDataXtd_Array1OfTrsf.hxx>
#include<TDataXtd_Axis.hxx>
#include<TDataXtd_Constraint.hxx>
#include<TDataXtd_ConstraintEnum.hxx>
#include<TDataXtd_Geometry.hxx>
#include<TDataXtd_GeometryEnum.hxx>
#include<TDataXtd_HArray1OfTrsf.hxx>
#include<TDataXtd_Pattern.hxx>
#include<TDataXtd_PatternStd.hxx>
#include<TDataXtd_Placement.hxx>
#include<TDataXtd_Plane.hxx>
#include<TDataXtd_Point.hxx>
#include<TDataXtd_Position.hxx>
#include<TDataXtd_Presentation.hxx>
#include<TDataXtd_Shape.hxx>
#include<TDataXtd_Triangulation.hxx>
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
#include<TDF.hxx>
#include<TDF_AttributeList.hxx>
#include<TDF_Reference.hxx>
#include<TDF_DoubleMapIteratorOfGUIDProgIDMap.hxx>
#include<TDF_GUIDProgIDMap.hxx>
#include<TDF_CopyTool.hxx>
#include<TDF_DeltaOnResume.hxx>
#include<TDF_ChildIterator.hxx>
#include<TDF_DeltaOnRemoval.hxx>
#include<TDF_ClosureMode.hxx>
#include<TDF_LabelNode.hxx>
#include<TDF_AttributeArray1.hxx>
#include<TDF_AttributeMap.hxx>
#include<TDF_DoubleMapIteratorOfLabelDoubleMap.hxx>
#include<TDF_AttributeDelta.hxx>
#include<TDF_ClosureTool.hxx>
#include<TDF_DeltaOnAddition.hxx>
#include<TDF_DoubleMapIteratorOfAttributeDoubleMap.hxx>
#include<TDF_Label.hxx>
#include<TDF_IDList.hxx>
#include<TDF_LabelSequence.hxx>
#include<TDF_AttributeDeltaList.hxx>
#include<TDF_ListIteratorOfAttributeDeltaList.hxx>
#include<TDF_LabelDoubleMap.hxx>
#include<TDF_LabelNodePtr.hxx>
#include<TDF_HAllocator.hxx>
#include<TDF_Attribute.hxx>
#include<TDF_LabelMap.hxx>
#include<TDF_CopyLabel.hxx>
#include<TDF_Tool.hxx>
#include<TDF_AttributeIndexedMap.hxx>
#include<TDF_AttributeDoubleMap.hxx>
#include<TDF_TagSource.hxx>
#include<TDF_Delta.hxx>
#include<TDF_DataMapIteratorOfAttributeDataMap.hxx>
#include<TDF_AttributeDataMap.hxx>
#include<TDF_MapIteratorOfAttributeMap.hxx>
#include<TDF_ListIteratorOfAttributeList.hxx>
#include<TDF_IDMap.hxx>
#include<TDF_DefaultDeltaOnModification.hxx>
#include<TDF_ListIteratorOfLabelList.hxx>
#include<TDF_RelocationTable.hxx>
#include<TDF_DeltaOnModification.hxx>
#include<TDF_LabelDataMap.hxx>
#include<TDF_IDFilter.hxx>
#include<TDF_MapIteratorOfLabelMap.hxx>
#include<TDF_DataMapIteratorOfLabelIntegerMap.hxx>
#include<TDF_DeltaList.hxx>
#include<TDF_ComparisonTool.hxx>
#include<TDF_Transaction.hxx>
#include<TDF_HAttributeArray1.hxx>
#include<TDF_LabelIndexedMap.hxx>
#include<TDF_LabelIntegerMap.hxx>
#include<TDF_DeltaOnForget.hxx>
#include<TDF_DefaultDeltaOnRemoval.hxx>
#include<TDF_ChildIDIterator.hxx>
#include<TDF_ListIteratorOfDeltaList.hxx>
#include<TDF_ListIteratorOfIDList.hxx>
#include<TDF_DataMapIteratorOfLabelDataMap.hxx>
#include<TDF_LabelList.hxx>
#include<TDF_DataSet.hxx>
#include<TDF_AttributeIterator.hxx>
#include<TDF_AttributeSequence.hxx>
#include<TDF_Data.hxx>
#include<TDF_MapIteratorOfIDMap.hxx>
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
#include<TNaming.hxx>
#include<TNaming_DataMapOfShapePtrRefShape.hxx>
#include<TNaming_NewShapeIterator.hxx>
#include<TNaming_ShapesSet.hxx>
#include<TNaming_ListOfIndexedDataMapOfShapeListOfShape.hxx>
#include<TNaming_PtrAttribute.hxx>
#include<TNaming_Name.hxx>
#include<TNaming_Iterator.hxx>
#include<TNaming_NamedShapeHasher.hxx>
#include<TNaming_DataMapIteratorOfDataMapOfShapeShapesSet.hxx>
#include<TNaming_NamingTool.hxx>
#include<TNaming_NCollections.hxx>
#include<TNaming_PtrRefShape.hxx>
#include<TNaming_OldShapeIterator.hxx>
#include<TNaming_SameShapeIterator.hxx>
#include<TNaming_CopyShape.hxx>
#include<TNaming_DeltaOnRemoval.hxx>
#include<TNaming_ListIteratorOfListOfNamedShape.hxx>
#include<TNaming_NamedShape.hxx>
#include<TNaming_Selector.hxx>
#include<TNaming_MapIteratorOfMapOfNamedShape.hxx>
#include<TNaming_Evolution.hxx>
#include<TNaming_IteratorOnShapesSet.hxx>
#include<TNaming_DeltaOnModification.hxx>
#include<TNaming_DataMapIteratorOfDataMapOfShapePtrRefShape.hxx>
#include<TNaming_Tool.hxx>
#include<TNaming_Scope.hxx>
#include<TNaming_NameType.hxx>
#include<TNaming_UsedShapes.hxx>
#include<TNaming_Identifier.hxx>
#include<TNaming_MapOfNamedShape.hxx>
#include<TNaming_ListOfNamedShape.hxx>
#include<TNaming_DataMapOfShapeShapesSet.hxx>
#include<TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape.hxx>
#include<TNaming_ListOfMapOfShape.hxx>
#include<TNaming_Translator.hxx>
#include<TNaming_Naming.hxx>
#include<TNaming_Localizer.hxx>
#include<TNaming_Builder.hxx>
#include<TNaming_TranslateTool.hxx>
#include<TNaming_ListIteratorOfListOfMapOfShape.hxx>
#include<TNaming_PtrNode.hxx>
#include<TNaming_RefShape.hxx>
#include<TDataStd.hxx>
#include<TDataStd_DataMapOfStringHArray1OfInteger.hxx>
#include<TDataStd_ExtStringList.hxx>
#include<TDataStd_TreeNode.hxx>
#include<TDataStd_IntegerArray.hxx>
#include<TDataStd_RealList.hxx>
#include<TDataStd_NamedData.hxx>
#include<TDataStd_DataMapOfStringByte.hxx>
#include<TDataStd_HLabelArray1.hxx>
#include<TDataStd_RealEnum.hxx>
#include<TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfReal.hxx>
#include<TDataStd_Relation.hxx>
#include<TDataStd_IntPackedMap.hxx>
#include<TDataStd_HDataMapOfStringHArray1OfInteger.hxx>
#include<TDataStd_Comment.hxx>
#include<TDataStd_LabelArray1.hxx>
#include<TDataStd_Integer.hxx>
#include<TDataStd_DeltaOnModificationOfExtStringArray.hxx>
#include<TDataStd_DataMapOfStringString.hxx>
#include<TDataStd_Variable.hxx>
#include<TDataStd_ListOfExtendedString.hxx>
#include<TDataStd_Expression.hxx>
#include<TDataStd_Name.hxx>
#include<TDataStd_ChildNodeIterator.hxx>
#include<TDataStd_DeltaOnModificationOfByteArray.hxx>
#include<TDataStd_BooleanList.hxx>
#include<TDataStd_ListIteratorOfListOfByte.hxx>
#include<TDataStd_ByteArray.hxx>
#include<TDataStd_ListOfByte.hxx>
#include<TDataStd_HDataMapOfStringByte.hxx>
#include<TDataStd_ReferenceArray.hxx>
#include<TDataStd_PtrTreeNode.hxx>
#include<TDataStd_DataMapIteratorOfDataMapOfStringHArray1OfInteger.hxx>
#include<TDataStd_Directory.hxx>
#include<TDataStd_UAttribute.hxx>
#include<TDataStd_NoteBook.hxx>
#include<TDataStd_AsciiString.hxx>
#include<TDataStd_Real.hxx>
#include<TDataStd_HDataMapOfStringInteger.hxx>
#include<TDataStd_ReferenceList.hxx>
#include<TDataStd_Current.hxx>
#include<TDataStd_RealArray.hxx>
#include<TDataStd_HDataMapOfStringHArray1OfReal.hxx>
#include<TDataStd_HDataMapOfStringReal.hxx>
#include<TDataStd_DeltaOnModificationOfRealArray.hxx>
#include<TDataStd_DataMapOfStringHArray1OfReal.hxx>
#include<TDataStd_ExtStringArray.hxx>
#include<TDataStd_HDataMapOfStringString.hxx>
#include<TDataStd_BooleanArray.hxx>
#include<TDataStd_DataMapIteratorOfDataMapOfStringString.hxx>
#include<TDataStd_DeltaOnModificationOfIntPackedMap.hxx>
#include<TDataStd_DataMapIteratorOfDataMapOfStringReal.hxx>
#include<TDataStd_IntegerList.hxx>
#include<TDataStd_DeltaOnModificationOfIntArray.hxx>
#include<TDataStd_DataMapOfStringReal.hxx>
#include<TDataStd_DataMapIteratorOfDataMapOfStringByte.hxx>
#include<TDataStd_Tick.hxx>
#include<TDataStd_ListIteratorOfListOfExtendedString.hxx>
#include<Quantity_ElectricPotential.hxx>
#include<Quantity_Resistivity.hxx>
#include<Quantity_AbsorbedDose.hxx>
#include<Quantity_ElectricFieldStrength.hxx>
#include<Quantity_MolarMass.hxx>
#include<Quantity_Velocity.hxx>
#include<Quantity_ColorRGBA.hxx>
#include<Quantity_Admittance.hxx>
#include<Quantity_MagneticFieldStrength.hxx>
#include<Quantity_Momentum.hxx>
#include<Quantity_Content.hxx>
#include<Quantity_AcousticIntensity.hxx>
#include<Quantity_DoseEquivalent.hxx>
#include<Quantity_Rate.hxx>
#include<Quantity_Activity.hxx>
#include<Quantity_Normality.hxx>
#include<Quantity_Impedance.hxx>
#include<Quantity_Date.hxx>
#include<Quantity_ColorDefinitionError.hxx>
#include<Quantity_Energy.hxx>
#include<Quantity_SoundIntensity.hxx>
#include<Quantity_Luminance.hxx>
#include<Quantity_CoefficientOfExpansion.hxx>
#include<Quantity_Illuminance.hxx>
#include<Quantity_Capacitance.hxx>
#include<Quantity_Weight.hxx>
#include<Quantity_NameOfColor.hxx>
#include<Quantity_Ratio.hxx>
#include<Quantity_HArray1OfColor.hxx>
#include<Quantity_MolarConcentration.hxx>
#include<Quantity_Quotient.hxx>
#include<Quantity_Factor.hxx>
#include<Quantity_MassFlow.hxx>
#include<Quantity_Consumption.hxx>
#include<Quantity_Entropy.hxx>
#include<Quantity_Array1OfColor.hxx>
#include<Quantity_Concentration.hxx>
#include<Quantity_Pressure.hxx>
#include<Quantity_Resistance.hxx>
#include<Quantity_Frequency.hxx>
#include<Quantity_ThermalConductivity.hxx>
#include<Quantity_Length.hxx>
#include<Quantity_Inductance.hxx>
#include<Quantity_Torque.hxx>
#include<Quantity_Mass.hxx>
#include<Quantity_SurfaceTension.hxx>
#include<Quantity_TypeOfColor.hxx>
#include<Quantity_KineticMoment.hxx>
#include<Quantity_Period.hxx>
#include<Quantity_Work.hxx>
#include<Quantity_Speed.hxx>
#include<Quantity_PeriodDefinitionError.hxx>
#include<Quantity_Index.hxx>
#include<Quantity_Power.hxx>
#include<Quantity_Array2OfColor.hxx>
#include<Quantity_MomentOfInertia.hxx>
#include<Quantity_Molarity.hxx>
#include<Quantity_ElectricCharge.hxx>
#include<Quantity_ElectricCapacitance.hxx>
#include<Quantity_Scalaire.hxx>
#include<Quantity_Density.hxx>
#include<Quantity_PhysicalQuantity.hxx>
#include<Quantity_MolarVolume.hxx>
#include<Quantity_MomentOfAForce.hxx>
#include<Quantity_AngularVelocity.hxx>
#include<Quantity_LuminousIntensity.hxx>
#include<Quantity_Volume.hxx>
#include<Quantity_ElectricCurrent.hxx>
#include<Quantity_Reluctance.hxx>
#include<Quantity_DateDefinitionError.hxx>
#include<Quantity_Parameter.hxx>
#include<Quantity_Coefficient.hxx>
#include<Quantity_Area.hxx>
#include<Quantity_SolidAngle.hxx>
#include<Quantity_AmountOfSubstance.hxx>
#include<Quantity_LuminousEfficacity.hxx>
#include<Quantity_LuminousExposition.hxx>
#include<Quantity_MagneticFlux.hxx>
#include<Quantity_ColorRGBAHasher.hxx>
#include<Quantity_Conductivity.hxx>
#include<Quantity_Enthalpy.hxx>
#include<Quantity_Force.hxx>
#include<Quantity_PlaneAngle.hxx>
#include<Quantity_Acceleration.hxx>
#include<Quantity_KinematicViscosity.hxx>
#include<Quantity_Convert.hxx>
#include<Quantity_MagneticFluxDensity.hxx>
#include<Quantity_Temperature.hxx>
#include<Quantity_LuminousFlux.hxx>
#include<Quantity_ColorHasher.hxx>
#include<Quantity_Viscosity.hxx>
#include<Quantity_SpecificHeatCapacity.hxx>
#include<Quantity_Color.hxx>
#include<Quantity_VolumeFlow.hxx>
#include<Quantity_Constant.hxx>
#include<TopoDS.hxx>
#include<TopoDS_TWire.hxx>
#include<TopoDS_ListIteratorOfListOfShape.hxx>
#include<TopoDS_TVertex.hxx>
#include<TopoDS_HShape.hxx>
#include<TopoDS_Shell.hxx>
#include<TopoDS_UnCompatibleShapes.hxx>
#include<TopoDS_LockedShape.hxx>
#include<TopoDS_TEdge.hxx>
#include<TopoDS_Shape.hxx>
#include<TopoDS_Builder.hxx>
#include<TopoDS_TCompSolid.hxx>
#include<TopoDS_Solid.hxx>
#include<TopoDS_Iterator.hxx>
#include<TopoDS_Face.hxx>
#include<TopoDS_CompSolid.hxx>
#include<TopoDS_TSolid.hxx>
#include<TopoDS_Edge.hxx>
#include<TopoDS_TShape.hxx>
#include<TopoDS_Vertex.hxx>
#include<TopoDS_AlertWithShape.hxx>
#include<TopoDS_Compound.hxx>
#include<TopoDS_ListOfShape.hxx>
#include<TopoDS_TCompound.hxx>
#include<TopoDS_FrozenShape.hxx>
#include<TopoDS_TShell.hxx>
#include<TopoDS_TFace.hxx>
#include<TopoDS_Wire.hxx>
#include<Poly.hxx>
#include<Poly_CoherentLink.hxx>
#include<Poly_CoherentNode.hxx>
#include<Poly_CoherentTriPtr.hxx>
#include<Poly_Triangle.hxx>
#include<Poly_Polygon2D.hxx>
#include<Poly_MakeLoops.hxx>
#include<Poly_ListOfTriangulation.hxx>
#include<Poly_Polygon3D.hxx>
#include<Poly_Array1OfTriangle.hxx>
#include<Poly_PolygonOnTriangulation.hxx>
#include<Poly_HArray1OfTriangle.hxx>
#include<Poly_CoherentTriangulation.hxx>
#include<Poly_CoherentTriangle.hxx>
#include<Poly_Triangulation.hxx>
#include<Poly_Connect.hxx>
#include<TShort_SequenceOfShortReal.hxx>
#include<TShort_HArray1OfShortReal.hxx>
#include<TShort_HArray2OfShortReal.hxx>
#include<TShort_Array2OfShortReal.hxx>
#include<TShort_HSequenceOfShortReal.hxx>
#include<TShort_Array1OfShortReal.hxx>
#include<TopTools.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger.hxx>
#include<TopTools_DataMapOfIntegerListOfShape.hxx>
#include<TopTools_DataMapOfShapeSequenceOfShape.hxx>
#include<TopTools_SequenceOfShape.hxx>
#include<TopTools_IndexedDataMapOfShapeShape.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfShapeListOfShape.hxx>
#include<TopTools_LocationSetPtr.hxx>
#include<TopTools_DataMapOfShapeListOfShape.hxx>
#include<TopTools_IndexedMapOfShape.hxx>
#include<TopTools_MapOfShape.hxx>
#include<TopTools_HSequenceOfShape.hxx>
#include<TopTools_ListOfShape.hxx>
#include<TopTools_ShapeSet.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfShapeReal.hxx>
#include<TopTools_DataMapOfShapeInteger.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger.hxx>
#include<TopTools_IndexedMapOfOrientedShape.hxx>
#include<TopTools_HArray2OfShape.hxx>
#include<TopTools_HArray1OfShape.hxx>
#include<TopTools_Array1OfShape.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape.hxx>
#include<TopTools_Array1OfListOfShape.hxx>
#include<TopTools_MutexForShapeProvider.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfShapeShape.hxx>
#include<TopTools_MapIteratorOfMapOfOrientedShape.hxx>
#include<TopTools_ShapeMapHasher.hxx>
#include<TopTools_IndexedDataMapOfShapeListOfShape.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfShapeInteger.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape.hxx>
#include<TopTools_ListIteratorOfListOfShape.hxx>
#include<TopTools_DataMapOfShapeShape.hxx>
#include<TopTools_HArray1OfListOfShape.hxx>
#include<TopTools_DataMapOfIntegerShape.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfIntegerShape.hxx>
#include<TopTools_DataMapOfShapeReal.hxx>
#include<TopTools_LocationSet.hxx>
#include<TopTools_MapIteratorOfMapOfShape.hxx>
#include<TopTools_IndexedDataMapOfShapeAddress.hxx>
#include<TopTools_OrientedShapeMapHasher.hxx>
#include<TopTools_MapOfOrientedShape.hxx>
#include<TopTools_DataMapOfOrientedShapeShape.hxx>
#include<TopTools_DataMapOfShapeListOfInteger.hxx>
#include<TopTools_DataMapOfOrientedShapeInteger.hxx>
#include<TopTools_Array2OfShape.hxx>
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
#include<Message.hxx>
#include<Message_Msg.hxx>
#include<Message_Status.hxx>
#include<Message_Gravity.hxx>
#include<Message_PrinterOStream.hxx>
#include<Message_Report.hxx>
#include<Message_Alert.hxx>
#include<Message_ListOfMsg.hxx>
#include<Message_ExecStatus.hxx>
#include<Message_ProgressIndicator.hxx>
#include<Message_Algorithm.hxx>
#include<Message_SequenceOfPrinters.hxx>
#include<Message_ProgressSentry.hxx>
#include<Message_MsgFile.hxx>
#include<Message_Printer.hxx>
#include<Message_SequenceOfProgressScale.hxx>
#include<Message_Messenger.hxx>
#include<Message_StatusType.hxx>
#include<Message_ProgressScale.hxx>
#include<Message_HArrayOfMsg.hxx>
#include<Message_ListOfAlert.hxx>
#include<Message_ListIteratorOfListOfMsg.hxx>
#include<TopLoc_MapOfLocation.hxx>
#include<TopLoc_MapIteratorOfMapOfLocation.hxx>
#include<TopLoc_Datum3D.hxx>
#include<TopLoc_ItemLocation.hxx>
#include<TopLoc_IndexedMapOfLocation.hxx>
#include<TopLoc_MapLocationHasher.hxx>
#include<TopLoc_Location.hxx>
#include<TopLoc_SListNodeOfItemLocation.hxx>
#include<TopLoc_SListOfItemLocation.hxx>
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
%import TDF.i
%import gp.i
%import TNaming.i
%import TDataStd.i
%import Quantity.i
%import TopoDS.i
%import Poly.i
%import TShort.i
