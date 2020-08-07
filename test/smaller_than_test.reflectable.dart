// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import "dart:core";
import 'package:flutter_model_form_validation/src/annotations/flutter_model_form_validator.dart'
    as prefix0;
import 'package:flutter_model_form_validation/src/annotations/validators/smaller_than.dart'
    as prefix2;
import 'smaller_than_test.dart' as prefix1;

// ignore_for_file: unnecessary_const

// ignore:unused_import
import "package:reflectable/mirrors.dart" as m;
// ignore:unused_import
import "package:reflectable/src/reflectable_builder_based.dart" as r;
// ignore:unused_import
import "package:reflectable/reflectable.dart" as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.FlutterModelFormValidator(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r"SmallerThanTest",
            r".SmallerThanTest",
            7,
            0,
            const prefix0.FlutterModelFormValidator(),
            const <int>[0, 1, 2, 3],
            const <int>[8, 9, 10, 11, 12, 4, 5, 6, 7],
            const <int>[],
            -1,
            {},
            {},
            {},
            -1,
            -1,
            const <int>[-1],
            const <Object>[prefix0.flutterModelFormValidator],
            null)
      ],
      <m.DeclarationMirror>[
        r.VariableMirrorImpl(
            r"a",
            33797,
            0,
            const prefix0.FlutterModelFormValidator(),
            -1,
            -1,
            -1,
            null, const <Object>[
          const prefix2.SmallerThan(
              propertyName: 'b',
              error: '"a" property must be smaller or equal to "b" property')
        ]),
        r.VariableMirrorImpl(
            r"b",
            33797,
            0,
            const prefix0.FlutterModelFormValidator(),
            -1,
            -1,
            -1,
            null, const []),
        r.VariableMirrorImpl(
            r"c",
            33797,
            0,
            const prefix0.FlutterModelFormValidator(),
            -1,
            -1,
            -1,
            null, const <Object>[
          const prefix2.SmallerThan(
              propertyName: 'd',
              error: '"c" property must be smaller or equal to "d" property')
        ]),
        r.VariableMirrorImpl(
            r"d",
            33797,
            0,
            const prefix0.FlutterModelFormValidator(),
            -1,
            -1,
            -1,
            null, const []),
        r.ImplicitGetterMirrorImpl(
            const prefix0.FlutterModelFormValidator(), 0, -1, -1, 4),
        r.ImplicitGetterMirrorImpl(
            const prefix0.FlutterModelFormValidator(), 1, -1, -1, 5),
        r.ImplicitGetterMirrorImpl(
            const prefix0.FlutterModelFormValidator(), 2, -1, -1, 6),
        r.ImplicitGetterMirrorImpl(
            const prefix0.FlutterModelFormValidator(), 3, -1, -1, 7),
        r.MethodMirrorImpl(
            r"==",
            131074,
            null,
            -1,
            -1,
            -1,
            null,
            const <int>[0],
            const prefix0.FlutterModelFormValidator(),
            const []),
        r.MethodMirrorImpl(r"toString", 131074, null, -1, -1, -1, null,
            const <int>[], const prefix0.FlutterModelFormValidator(), const []),
        r.MethodMirrorImpl(
            r"noSuchMethod",
            65538,
            null,
            null,
            -1,
            -1,
            null,
            const <int>[1],
            const prefix0.FlutterModelFormValidator(),
            const []),
        r.MethodMirrorImpl(r"hashCode", 131075, null, -1, -1, -1, null,
            const <int>[], const prefix0.FlutterModelFormValidator(), const []),
        r.MethodMirrorImpl(r"runtimeType", 131075, null, -1, -1, -1, null,
            const <int>[], const prefix0.FlutterModelFormValidator(), const [])
      ],
      <m.ParameterMirror>[
        r.ParameterMirrorImpl(
            r"other",
            16390,
            8,
            const prefix0.FlutterModelFormValidator(),
            null,
            -1,
            -1,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r"invocation",
            32774,
            10,
            const prefix0.FlutterModelFormValidator(),
            -1,
            -1,
            -1,
            null,
            const [],
            null,
            null)
      ],
      <Type>[prefix1.SmallerThanTest],
      1,
      {
        r"==": (dynamic instance) => (x) => instance == x,
        r"toString": (dynamic instance) => instance.toString,
        r"noSuchMethod": (dynamic instance) => instance.noSuchMethod,
        r"hashCode": (dynamic instance) => instance.hashCode,
        r"runtimeType": (dynamic instance) => instance.runtimeType,
        r"a": (dynamic instance) => instance.a,
        r"b": (dynamic instance) => instance.b,
        r"c": (dynamic instance) => instance.c,
        r"d": (dynamic instance) => instance.d
      },
      {},
      null,
      [])
};

final _memberSymbolMap = null;

initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}
