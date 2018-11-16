#!/usr/bin/env python

##Copyright 2009-2016 Thomas Paviot (tpaviot@gmail.com)
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU Lesser General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU Lesser General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

import pickle
import unittest
import os
from math import sqrt

from OCC.Core.Standard import Standard_Transient, Handle_Standard_Transient
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.Core.BRepBuilderAPI import (BRepBuilderAPI_MakeVertex,
                                BRepBuilderAPI_MakeEdge)
from OCC.Core.gp import (gp_Pnt, gp_Vec, gp_Pnt2d, gp_Lin, gp_Dir,
                    gp_Quaternion, gp_QuaternionSLerp)
from OCC.Core.GC import GC_MakeSegment
from OCC.Core.STEPControl import STEPControl_Writer
from OCC.Core.Interface import Interface_Static_SetCVal, Interface_Static_CVal
from OCC.Core.GCE2d import GCE2d_MakeSegment
from OCC.Core.ShapeFix import ShapeFix_Solid, ShapeFix_Wire
from OCC.Core.TopoDS import TopoDS_Compound, TopoDS_Builder, TopoDS_Edge
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeCylinder
from OCC.Core.TColStd import TColStd_Array1OfReal, TColStd_Array1OfInteger
from OCC.Core.TopExp import TopExp_Explorer
from OCC.Core.TopAbs import TopAbs_FACE
from OCC.Core.GProp import GProp_GProps
from OCC.Core.BRepGProp import brepgprop_LinearProperties
from OCC.Core.ShapeAnalysis import ShapeAnalysis_Curve
from OCC.Core.BRep import BRep_Builder
from OCC.Core.ChFiDS import ChFiDS_ChamfSpine
from OCC.Core.Graphic3d import Graphic3d_RenderingParams
from OCC.Core.BRepCheck import (BRepCheck_ListIteratorOfListOfStatus,
                           BRepCheck_ListOfStatus, BRepCheck_Multiple3DCurve,
                           BRepCheck_EmptyWire)
from OCC.Core.Geom import Geom_Curve, Geom_Line, Geom_BSplineCurve
from OCC.Core.BRep import BRep_Tool_Curve


class TestWrapperFeatures(unittest.TestCase):
    def test_hash(self):
        '''
        Check whether the __hash__ function is equal to HashCode()
        '''
        s = Standard_Transient()
        id_s = id(s)
        hash1_s = s.__hash__()
        self.assertNotEqual(id_s, hash1_s)

    def test_const_Standard_Real_byref(self):
        '''
        Test wrapper for const Standard_Real &
        '''
        t = TColStd_Array1OfReal(1, 10)
        t.SetValue(3, 3.14)
        self.assertEqual(t.Value(3), 3.14)

    def test_const_Standard_Integer_byref(self):
        '''
        Test wrapper for const Standard_Integer &
        '''
        t = TColStd_Array1OfInteger(1, 2)
        t.SetValue(1, 3)
        t.SetValue(2, 33)
        self.assertEqual(t.Value(1), 3)
        self.assertEqual(t.Value(2), 33)

    def test_handle_standard_transient_copy(self):
        def evil_function(t):
            handle = Standard_Transient(t)
        t = Standard_Transient()
        evil_function(t)

    def test_list(self):
        '''
        Test python lists features
        '''
        P1 = gp_Pnt(1, 2, 3)
        P2 = gp_Pnt(2, 3, 4)
        P3 = gp_Pnt(5, 7, 8)
        l = [P1, P2]
        self.assertEqual(P1 in l, True)
        self.assertNotEqual(P3 in l, True)
        self.assertEqual(l.index(P1), 0)
        self.assertEqual(l.index(P2), 1)
        # Do the same for Vertices (TopoDS_Shape has
        # a HashCode() method overloaded
        V1 = BRepBuilderAPI_MakeVertex(P1).Vertex()
        V2 = BRepBuilderAPI_MakeVertex(P2).Vertex()
        V3 = BRepBuilderAPI_MakeVertex(P3) .Vertex()
        vl = [V1, V2]
        self.assertEqual(V1 in vl, True)
        self.assertNotEqual(V3 in vl, True)
        # index test()
        self.assertEqual(vl.index(V1), 0)
        self.assertEqual(vl.index(V2), 1)
        # reverse() test
        vl.reverse()
        self.assertEqual(vl.index(V1), 1)
        self.assertEqual(vl.index(V2), 0)

    def test_dict(self):
        '''
        Test python dict features
        '''
        P1 = gp_Pnt(1, 2, 3)
        P2 = gp_Pnt(2, 3, 4)
        d = {P1: 'P1', P2: 'P2'}
        self.assertEqual(d[P1] == 'P1', True)
        self.assertEqual(d[P2] == 'P2', True)

    def test_topology(self):
        '''
        Checks the Topology.py utility script.
        '''
        def get_shape():
            shape = BRepPrimAPI_MakeBox(10., 10., 10.).Shape()
            self.assertEqual(shape.IsNull(), False)
            return shape
        returned_shape = get_shape()
        self.assertEqual(returned_shape.IsNull(), False)

    def test_gp_Vec_operators(self):
        '''
        Test gp_Vec division by a float number or an integer
        This test fails on py3k with SWIG versions older than 3.0.8
        SWIG 3.0.9 fixes this issue.
        See https://github.com/tpaviot/pythonocc-core/issues/257
        '''
        # division by a float
        v1 = gp_Vec(2., 2., 2.)
        v2 = v1 / 2.
        self.assertEqual(v2.Magnitude(), sqrt(3.))
        # division by an integer
        v3 = gp_Vec(4, 4, 4)
        v4 = v3 / 2
        self.assertEqual((v4.X(), v4.Y(), v4.Z()), (2, 2, 2))
        # adding two gp_Vec
        v5 = gp_Vec(1, 2, 3) + gp_Vec(4, 5, 6)
        self.assertEqual((v5.X(), v5.Y(), v5.Z()), (5, 7, 9))
        # substracting two gp_Vec
        v6 = gp_Vec(1, 2, 3) - gp_Vec(6, 5, 4)
        self.assertEqual((v6.X(), v6.Y(), v6.Z()), (-5, -3, -1))


    def test_gp_Quaternion(self):
        '''
        Test Interpolate method of qp_QuaternionSLerp.
        This method takes a by ref parameter q.
        '''
        vX = gp_Vec(12, 0, 0)
        vY = gp_Vec(0, 12, 0)
        v45 = (gp_Vec(1, 1, 1).Normalized() * 12)
        q = gp_Quaternion()
        q1 = gp_Quaternion(vX, vX)
        q2 = gp_Quaternion(vX, vY)
        interp = gp_QuaternionSLerp(q1, q2)
        interp.Init(q1, q2)
        for i in range(10):
            i__ = i / 10.
            interp.Interpolate(i__, q)
            if i == 0:
                self.assertEqual(q.X(), 0.)
                self.assertEqual(q.Y(), 0.)
                self.assertEqual(q.Z(), 0.)
                self.assertEqual(q.W(), 1.)
            else:
                self.assertEqual(q.X(), 0.)
                self.assertEqual(q.Y(), 0.)
                assert q.Z() > 0.
                assert q.W() < 1.


    def test_traverse_box_topology(self):
        '''
        Test traversing faces for a box. Assert 6 faces are returned
        '''
        box_shp = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()

        def get_faces(shp):
            ex = TopExp_Explorer(shp, TopAbs_FACE)
            seq = []
            while ex.More():
                s1 = ex.Current()
                seq.append(s1)
                ex.Next()
            return seq
        faces = get_faces(box_shp)
        self.assertEqual(len(faces), 6)
        for f in faces:
            self.assertEqual(f.IsNull(), False)

    def test_static_method(self):
        '''
        Test wrapper for static methods.

        ... snippet from the SWIG documentation ...

        Static class members present a special problem for Python.
        Prior to Python-2.2, Python classes had no support for static methods
        and no version of Python supports static member variables in a manner
        that
        SWIG can utilize. Therefore, SWIG generates wrappers that try to work
        around
        some of these issues. To illustrate, suppose you have a class like
        this:

        class Spam {
        public:
           static void foo();
           static int bar;
        };
        In Python, the static member can be access in three different ways:

        >>> example.Spam_foo()    # Spam::foo()
        >>> s = example.Spam()
        >>> s.foo()               # Spam::foo() via an instance
        >>> example.Spam.foo()    # Spam::foo(). Python-2.2 only

        ... end snippet ...

        In order that SWIG properly wraps static methods, the keyword 'static'
        must be included in the interface file. For instance, in the
        Interface.i file, the following line:

        static Standard_Boolean SetCVal(const char * name, const char * val);

        makes possible to use the method as:
        >>> from OCC.Core.Interface import *
        >>> Interface_Static_SetCVal("write.step.schema","AP203")
        '''
        # needs to be inited otherwise the following does not work
        STEPControl_Writer()
        # Note : static methods are wrapped with lowercase convention
        # so SetCVal can be accessed with setcval
        r = Interface_Static_SetCVal("write.step.schema", "AP203")
        self.assertEqual(r, 1)
        l = Interface_Static_CVal("write.step.schema")
        self.assertEqual(l, "AP203")

    def test_ft1(self):
        """ Test: Standard_Integer & by reference transformator """
        p = gp_Pnt(1, 2, 3.2)
        p_coord = p.Coord()
        self.assertEqual(p_coord[0], 1.)
        self.assertEqual(p_coord[1], 2.)
        self.assertEqual(p_coord[2], 3.2)

    # TODO : add a testStandardRealByRefPassedReturned
    def test_standard_integer_by_ref_passed_returned(self):
        '''
        Checks the Standard_Integer & byreference return parameter
        '''
        sfs = ShapeFix_Solid()
        sfs.SetFixShellMode(5)
        self.assertEqual(sfs.GetFixShellMode(), 5)

    def testStandardBooleanByRefPassedReturned(self):
        '''
        Checks the Standard_Boolean & byreference return parameter
        '''
        sfw = ShapeFix_Wire()
        sfw.SetModifyGeometryMode(True)
        self.assertEqual(sfw.GetModifyGeometryMode(), True)
        sfw.SetModifyGeometryMode(False)
        self.assertEqual(sfw.GetModifyGeometryMode(), False)

    def testTopoDS_byref_arguments(self):
        '''
        Test byref pass arguments to TopoDS
        '''
        cyl1 = BRepPrimAPI_MakeCylinder(10., 10.).Shape()
        cyl2 = BRepPrimAPI_MakeCylinder(100., 50.).Shape()
        c = TopoDS_Compound()
        bb = TopoDS_Builder()
        bb.MakeCompound(c)
        for child in [cyl1, cyl2]:
            bb.Add(c, child)

    def test_standard_boolean_byref(self):
        '''
        Test byref returned standard_boolean
        '''
        cs = ChFiDS_ChamfSpine()
        cs.SetDistAngle(1., 45, True)
        assert cs.GetDistAngle() == (1.0, 45.0, True)

    def test_dump_to_string(self):
        '''
        Checks if the pickle python module works for TopoDS_Shapes
        '''
        # Create the shape
        box_shape = BRepPrimAPI_MakeBox(100, 200, 300).Shape()
        shp_dump = pickle.dumps(box_shape)
        # write to file
        output = open("./test_io/box_shape_generated.brep", "wb")
        output.write(shp_dump)
        output.close()
        assert os.path.isfile("./test_io/box_shape_generated.brep")

    def test_pickle_from_file(self):
        '''
        Checks if the pickle python module works for TopoDS_Shapes
        '''
        shp_dump = open("./test_io/box_shape.brep", "rb")
        box_shape = pickle.load(shp_dump)
        shp_dump.close()
        self.assertFalse(box_shape.IsNull())

    def test_sub_class(self):
        """ Test: subclass """
        # Checks that OCC objects can be subclassed, and passed as parameters.
        # In this test, we create
        # a MyPoint and MyVec class, inheriting from gp_Pnt and gp_Vec.

        class MyPoint(gp_Pnt):
            def __init__(self, *kargs):
                gp_Pnt.__init__(self, *kargs)
                self.x = 4

            def get_x(self):
                return self.x

        class MyVec(gp_Vec):
            def __init__(self, *kargs):
                gp_Vec.__init__(self, *kargs)
                self._an_attribute = "something"

            def get_attribute(self):
                return self._an_attribute

        # Create the first point
        point1 = MyPoint(1., 2., 3.)
        point1_coord = point1.Coord()
        self.assertEqual(point1_coord[0], 1.)
        self.assertEqual(point1_coord[1], 2.)
        self.assertEqual(point1_coord[2], 3.)
        self.assertEqual(point1.get_x(), 4.)
        # Create the second point
        point2 = MyPoint(2., 2., 3.)
        # Then create the vec from these two points
        # The magnitude of the vector should equal 1.0
        vec = MyVec(point1, point2)
        self.assertEqual(vec.Magnitude(), 1.)
        self.assertEqual(vec.get_attribute(), "something")

    def testProtectedConstructor(self):
        """ Test: protected constructor """
        # 1st, class with no subclass
        from OCC.Core.TopoDS import TopoDS_Builder
        tds_builder = TopoDS_Builder()
        self.assertTrue(hasattr(tds_builder, "MakeCompound"))

    def testAutoImportOfDependentModules(self):
        """ Test: automatic import of dependent modules """
        returned_object = GCE2d_MakeSegment(gp_Pnt2d(1, 1),
                                            gp_Pnt2d(3, 4)).Value()
        # for this unittest, don't use the issinstance() function,
        # since the OCC.Geom2d module
        # is *not* manually imported
        returned_object_type = '%s' % type(returned_object)
        self.assertEqual(returned_object_type, "<class 'OCC.Core.Geom2d.Geom2d_TrimmedCurve'>")

    def test_hash_eq_operator(self):
        ''' test that the == wrapper is ok
        '''
        # test Standard
        s = Standard_Transient()
        s2 = Standard_Transient()
        self.assertFalse(s == s2)
        self.assertTrue(s == s)
        # test list.index, that uses __eq__ method
        p1 = gp_Pnt(0., 0., 0.)
        line = gp_Lin(p1, gp_Dir(1., 0., 0.))
        items = [p1, line]
        res = items.index(line)
        self.assertEqual(res, 1.)

    def test_eq_operator(self):
        shape_1 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
        shape_2 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
        self.assertFalse(shape_1 == shape_2)
        self.assertTrue(shape_1 == shape_1)
        self.assertFalse(shape_1 == "some_string")

    def test_neq_operator(self):
         # test Standard
        s = Standard_Transient()
        s2 = Standard_Transient()
        self.assertTrue(s != s2)
        self.assertFalse(s != s)
        shape_1 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
        shape_2 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
        self.assertTrue(shape_1 != shape_2)
        self.assertFalse(shape_1 != shape_1)
        self.assertTrue(shape_1 != "some_string")

    def test_inherit_topods_shape(self):
        at = self.assertTrue
        af = self.assertFalse

        class InheritEdge(TopoDS_Edge):
            def __init__(self, edge):
                # following constructor creates an empy TopoDS_Edge
                super(InheritEdge, self).__init__()
                # we need to copy the base shape using the following three
                # lines
                at(self.IsNull())
                self.TShape(edge.TShape())
                self.Location(edge.Location())
                self.Orientation(edge.Orientation())
                af(self.IsNull())
                # then it becomes possible to extend the base class
        # create a line, compute its length
        base_edge = BRepBuilderAPI_MakeEdge(gp_Pnt(100., 0., 0.),
                                            gp_Pnt(150., 0., 0.)).Edge()
        inherited_edge = InheritEdge(base_edge)
        g1 = GProp_GProps()
        brepgprop_LinearProperties(inherited_edge, g1)
        length = g1.Mass()
        self.assertEqual(length, 50.)

    def test_default_constructor_DEFINE_STANDARD_ALLOC(self):
        ''' OCE classes the defines standard alllocator can be instanciated
        if they're not abstract nor define any protected or private
        constructor '''
        BRep_Builder()
        TopoDS_Builder()
        ShapeAnalysis_Curve()

    def test_handling_exceptions(self):
        """ asserts that handling of OCC exceptions is handled correctly in pythonocc

        See Also
        --------

        issue #259 -- Standard errors like Standard_OutOfRange not caught

        """
        d = gp_Dir(0, 0, 1)
        with self.assertRaises(RuntimeError):
            d.Coord(-1)  # Standard_OutOfRange

    def test_memory_handle_getobject(self):
        """
        See https://github.com/tpaviot/pythonocc-generator/pull/24
        This commit tries to fix the issue tpaviot/pythonocc-core#292.
        When we got a handle from ann API function and called GetObject()
        the lifetime of the object was determined only by the handle.
        This lead to crashes, when only a reference to the object was stored.
        The commit registers the handle with its object to prevent premature
        destruction.
        This test case ensures everything is ok. Following lines used to crash
        on pythonocc-0.16.5
        """
        a = gp_Pnt(0., 0., 0.)
        b = gp_Pnt(100., 100., 100.)
        line3 = GC_MakeSegment(a, b).Value()
        assert line3.FirstParameter() == 0.
        assert GC_MakeSegment(a, b).Value().FirstParameter() == 0.
        assert b.IsEqual(line3.EndPoint(), 0.01)
        assert b.IsEqual(GC_MakeSegment(a, b).Value().EndPoint(), 0.01)



    def test_local_properties(self):
        """ Get and modify class local properties
        """
        graphic_params = Graphic3d_RenderingParams()
        assert graphic_params.RaytracingDepth == 3
        graphic_params.RaytracingDepth = 5
        assert graphic_params.RaytracingDepth == 5

    def test_repr_overload(self):
        """ Test if repr string is properly returned
        """
        p = gp_Pnt(1,2,3)
        assert str(p) == "class<'gp_Pnt'>"
        shp = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
        assert "class<'TopoDS_Shape'; Type:Solid; id:" in str(shp)

    def test_downcast_curve(self):
        """ Test if a GeomCurve can be DownCasted to a GeomLine
        """
        
        edge = BRepBuilderAPI_MakeEdge(gp_Pnt(0,0,0), gp_Pnt(1,0,0)).Edge()
        curve, _, _ = BRep_Tool_Curve(edge)
        assert isinstance(curve, Geom_Curve)
        # The edge is internally a line, so we should be able to downcast it
        line = Geom_Line.DownCast(curve)
        assert isinstance(curve, Geom_Curve)
        # Hence, it should not be possible to downcast it as a B-Spline curve
        bspline = Geom_BSplineCurve.DownCast(curve)
        assert bspline is None

    def test_return_enum(self):
        """ Check that returned enums are properly handled, wether they're returned
        by reference or not. To check that point, we use the BRepCheck_ListOfStatus class,
        where methods take and return BRepCheck_Status values
        """
        los1 = BRepCheck_ListOfStatus()
        los1.Append(BRepCheck_Multiple3DCurve)
        los1.Append(BRepCheck_EmptyWire)
        assert los1.First() == BRepCheck_Multiple3DCurve
        assert los1.Last() == BRepCheck_EmptyWire
        # then check with an iterator
        los2 = BRepCheck_ListOfStatus()
        los2.Append(BRepCheck_Multiple3DCurve)
        los2.Append(BRepCheck_EmptyWire)
        it = BRepCheck_ListIteratorOfListOfStatus(los2)
        while it.More():
            assert isinstance(it.Value(), int)
            it.Next()

    def test_deprecation_warning(self):
        """ since pythonocc-0.18.2. import OCC.* changed to import OCC.Core.*
        Such deprecated import raises a DeprecatedWarning
        """
        with self.assertWarns(DeprecationWarning):
            from OCC.gp import gp_Pln

    def test_deprecation_get_handle(self):
        """ Handles are now completely transparent. The GetHandle method is
        not required anymore.
        """
        t = Standard_Transient()
        with self.assertWarns(DeprecationWarning):
            t.GetHandle()

    def test_deprecation_handle_class(self):
        """ Handles are now completely transparent. The Handle_* constructor is
        not required anymore.
        """
        t = Standard_Transient()
        with self.assertWarns(DeprecationWarning):
            h = Handle_Standard_Transient(t)

    def test_deprecation_get_object(self):
        """ Handles are now completely transparent. The GetObject method is
        not required anymore.
        """
        t = Standard_Transient()
        with self.assertWarns(DeprecationWarning):
            t.GetObject()
    
    def test_deprecation_downcasts(self):
        t = Standard_Transient()
        with self.assertWarns(DeprecationWarning):
            Handle_Standard_Transient.DownCast(t)

def suite():
    test_suite = unittest.TestSuite()
    test_suite.addTest(unittest.makeSuite(TestWrapperFeatures))
    return test_suite

if __name__ == "__main__":
    unittest.main()
