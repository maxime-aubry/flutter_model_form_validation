// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import "dart:core";
import 'package:flutter_model_form_validation/src/annotations/flutter_model_form_validator.dart'
    as prefix0;
import 'package:flutter_model_form_validation/src/annotations/validators/regular_expression.dart'
    as prefix2;
import 'regular_expression_test.dart' as prefix1;

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
            r"RegularExpressionTest",
            r".RegularExpressionTest",
            7,
            0,
            const prefix0.FlutterModelFormValidator(),
            const <int>[0],
            const <int>[2, 3, 4, 5, 6, 1],
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
          const prefix2.RegularExpression(
              expression: r'^Hello|Bye$', error: 'invalid regular expression')
        ]),
        r.ImplicitGetterMirrorImpl(
            const prefix0.FlutterModelFormValidator(), 0, -1, -1, 1),
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
            2,
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
            4,
            const prefix0.FlutterModelFormValidator(),
            -1,
            -1,
            -1,
            null,
            const [],
            null,
            null)
      ],
      <Type>[prefix1.RegularExpressionTest],
      1,
      {
        r"==": (dynamic instance) => (x) => instance == x,
        r"toString": (dynamic instance) => instance.toString,
        r"noSuchMethod": (dynamic instance) => instance.noSuchMethod,
        r"hashCode": (dynamic instance) => instance.hashCode,
        r"runtimeType": (dynamic instance) => instance.runtimeType,
        r"a": (dynamic instance) => instance.a
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
