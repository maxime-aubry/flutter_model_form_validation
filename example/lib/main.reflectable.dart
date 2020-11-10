// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import 'dart:core';
import 'package:example/hero_model_form.dart' as prefix1;
import 'package:flutter_model_form_validation/src/annotations/flutter_model_form_validator.dart'
    as prefix0;
import 'package:flutter_model_form_validation/src/annotations/form_declarers/form_control_declarer.dart'
    as prefix2;
import 'package:flutter_model_form_validation/src/annotations/validators/multi_select.dart'
    as prefix7;
import 'package:flutter_model_form_validation/src/annotations/validators/required.dart'
    as prefix3;
import 'package:flutter_model_form_validation/src/annotations/validators/single_select.dart'
    as prefix5;
import 'package:flutter_model_form_validation/src/annotations/validators/smaller_than.dart'
    as prefix6;
import 'package:flutter_model_form_validation/src/annotations/validators/string_length.dart'
    as prefix4;
import 'package:meta/meta.dart' as prefix8;

// ignore_for_file: prefer_adjacent_string_concatenation
// ignore_for_file: prefer_collection_literals
// ignore_for_file: unnecessary_const
// ignore_for_file: implementation_imports

// ignore:unused_import
import 'package:reflectable/mirrors.dart' as m;
// ignore:unused_import
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
// ignore:unused_import
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.FlutterModelFormValidator(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r'HeroModelForm',
            r'.HeroModelForm',
            7,
            0,
            const prefix0.FlutterModelFormValidator(),
            const <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
            const <int>[
              10,
              11,
              12,
              13,
              14,
              15,
              16,
              17,
              18,
              19,
              20,
              21,
              0,
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9
            ],
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
        r.MethodMirrorImpl(
            r'addPower',
            262146,
            0,
            null,
            1,
            1,
            null,
            const <int>[0],
            const prefix0.FlutterModelFormValidator(),
            const []),
        r.MethodMirrorImpl(
            r'removePower',
            262146,
            0,
            null,
            1,
            1,
            null,
            const <int>[1],
            const prefix0.FlutterModelFormValidator(),
            const []),
        r.MethodMirrorImpl(
            r'name',
            131075,
            0,
            -1,
            2,
            2,
            null,
            const <int>[],
            const prefix0.FlutterModelFormValidator(),
            const <Object>[
              const prefix2.FormControlDeclarer(),
              const prefix3.Required(error: 'name is required'),
              const prefix4.StringLength(
                  min: 3,
                  max: 50,
                  error: 'name must have between 1 and 50 characters')
            ]),
        r.MethodMirrorImpl(
            r'gender',
            131075,
            0,
            -1,
            2,
            2,
            null,
            const <int>[],
            const prefix0.FlutterModelFormValidator(),
            const <Object>[
              const prefix2.FormControlDeclarer(),
              const prefix3.Required(error: 'gender is required'),
              const prefix5.SingleSelect(
                  serviceName: 'getGenderItems', error: 'invalid gender')
            ]),
        r.MethodMirrorImpl(
            r'birth_day',
            131075,
            0,
            -1,
            3,
            3,
            null,
            const <int>[],
            const prefix0.FlutterModelFormValidator(),
            const <Object>[
              const prefix2.FormControlDeclarer(),
              const prefix3.Required(error: 'birthday is required'),
              const prefix6.SmallerThan(
                  valueToCompareOnProperty: 'today',
                  error: 'hero must be born before today')
            ]),
        r.MethodMirrorImpl(
            r'powers',
            4325379,
            0,
            -1,
            4,
            5,
            null,
            const <int>[],
            const prefix0.FlutterModelFormValidator(),
            const <Object>[
              const prefix2.FormControlDeclarer(),
              const prefix3.Required(error: 'powers are required'),
              const prefix7.MultiSelect(
                  serviceName: 'getPowerItems',
                  error: 'item is not int he list of powers')
            ]),
        r.MethodMirrorImpl(r'today', 131075, 0, -1, 3, 3, null, const <int>[],
            const prefix0.FlutterModelFormValidator(), const []),
        r.MethodMirrorImpl(
            r'name=',
            262148,
            0,
            null,
            1,
            1,
            null,
            const <int>[2],
            const prefix0.FlutterModelFormValidator(),
            const []),
        r.MethodMirrorImpl(
            r'gender=',
            262148,
            0,
            null,
            1,
            1,
            null,
            const <int>[3],
            const prefix0.FlutterModelFormValidator(),
            const []),
        r.MethodMirrorImpl(
            r'birth_day=',
            262148,
            0,
            null,
            1,
            1,
            null,
            const <int>[4],
            const prefix0.FlutterModelFormValidator(),
            const []),
        r.MethodMirrorImpl(r'==', 131074, null, -1, 6, 6, null, const <int>[5],
            const prefix0.FlutterModelFormValidator(), const []),
        r.MethodMirrorImpl(r'toString', 131074, null, -1, 2, 2, null,
            const <int>[], const prefix0.FlutterModelFormValidator(), const []),
        r.MethodMirrorImpl(
            r'noSuchMethod',
            65538,
            null,
            null,
            null,
            null,
            null,
            const <int>[6],
            const prefix0.FlutterModelFormValidator(),
            const []),
        r.MethodMirrorImpl(r'hashCode', 131075, null, -1, 7, 7, null,
            const <int>[], const prefix0.FlutterModelFormValidator(), const []),
        r.MethodMirrorImpl(r'runtimeType', 131075, null, -1, 8, 8, null,
            const <int>[], const prefix0.FlutterModelFormValidator(), const []),
        r.MethodMirrorImpl(
            r'addListener',
            262146,
            null,
            null,
            1,
            1,
            null,
            const <int>[7, 8],
            const prefix0.FlutterModelFormValidator(),
            const <Object>[override]),
        r.MethodMirrorImpl(
            r'removeListener',
            262146,
            null,
            null,
            1,
            1,
            null,
            const <int>[9, 10],
            const prefix0.FlutterModelFormValidator(),
            const <Object>[override]),
        r.MethodMirrorImpl(
            r'dispose',
            262146,
            null,
            null,
            1,
            1,
            null,
            const <int>[],
            const prefix0.FlutterModelFormValidator(),
            const <Object>[override, prefix8.mustCallSuper]),
        r.MethodMirrorImpl(
            r'notifyListeners',
            262146,
            null,
            null,
            1,
            1,
            null,
            const <int>[11],
            const prefix0.FlutterModelFormValidator(),
            const <Object>[
              override,
              prefix8.protected,
              prefix8.visibleForTesting
            ]),
        r.MethodMirrorImpl(
            r'hasListeners',
            131075,
            null,
            -1,
            6,
            6,
            null,
            const <int>[],
            const prefix0.FlutterModelFormValidator(),
            const <Object>[
              override,
              prefix8.protected,
              prefix8.visibleForTesting
            ]),
        r.MethodMirrorImpl(
            r'notifyModelState',
            262146,
            null,
            null,
            1,
            1,
            null,
            const <int>[12],
            const prefix0.FlutterModelFormValidator(),
            const <Object>[prefix8.protected]),
        r.MethodMirrorImpl(
            r'getListenerName',
            131074,
            null,
            -1,
            2,
            2,
            null,
            const <int>[13],
            const prefix0.FlutterModelFormValidator(),
            const [])
      ],
      <m.ParameterMirror>[
        r.ParameterMirrorImpl(
            r'power',
            32774,
            0,
            const prefix0.FlutterModelFormValidator(),
            -1,
            2,
            2,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'power',
            32774,
            1,
            const prefix0.FlutterModelFormValidator(),
            -1,
            2,
            2,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'value',
            32774,
            7,
            const prefix0.FlutterModelFormValidator(),
            -1,
            2,
            2,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'value',
            32774,
            8,
            const prefix0.FlutterModelFormValidator(),
            -1,
            2,
            2,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'value',
            32774,
            9,
            const prefix0.FlutterModelFormValidator(),
            -1,
            3,
            3,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'other',
            32774,
            10,
            const prefix0.FlutterModelFormValidator(),
            -1,
            9,
            9,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'invocation',
            32774,
            12,
            const prefix0.FlutterModelFormValidator(),
            -1,
            10,
            10,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'listener',
            32774,
            15,
            const prefix0.FlutterModelFormValidator(),
            -1,
            11,
            11,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'properties',
            2134022,
            15,
            const prefix0.FlutterModelFormValidator(),
            -1,
            12,
            13,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'listener',
            32774,
            16,
            const prefix0.FlutterModelFormValidator(),
            -1,
            11,
            11,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'properties',
            2134022,
            16,
            const prefix0.FlutterModelFormValidator(),
            -1,
            12,
            13,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'property',
            4102,
            18,
            const prefix0.FlutterModelFormValidator(),
            null,
            -1,
            -1,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'property',
            32774,
            20,
            const prefix0.FlutterModelFormValidator(),
            -1,
            2,
            2,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'property',
            32774,
            21,
            const prefix0.FlutterModelFormValidator(),
            -1,
            2,
            2,
            null,
            const [],
            null,
            null)
      ],
      <Type>[
        prefix1.HeroModelForm,
        const m.TypeValue<void>().type,
        String,
        DateTime,
        const m.TypeValue<List<String>>().type,
        List,
        bool,
        int,
        Type,
        Object,
        Invocation,
        Function,
        const r.FakeType(r'dart.core.Iterable<T*>'),
        Iterable
      ],
      1,
      {
        r'==': (dynamic instance) => (x) => instance == x,
        r'toString': (dynamic instance) => instance.toString,
        r'noSuchMethod': (dynamic instance) => instance.noSuchMethod,
        r'hashCode': (dynamic instance) => instance.hashCode,
        r'runtimeType': (dynamic instance) => instance.runtimeType,
        r'addListener': (dynamic instance) => instance.addListener,
        r'removeListener': (dynamic instance) => instance.removeListener,
        r'dispose': (dynamic instance) => instance.dispose,
        r'notifyListeners': (dynamic instance) => instance.notifyListeners,
        r'hasListeners': (dynamic instance) => instance.hasListeners,
        r'notifyModelState': (dynamic instance) => instance.notifyModelState,
        r'getListenerName': (dynamic instance) => instance.getListenerName,
        r'addPower': (dynamic instance) => instance.addPower,
        r'removePower': (dynamic instance) => instance.removePower,
        r'name': (dynamic instance) => instance.name,
        r'gender': (dynamic instance) => instance.gender,
        r'birth_day': (dynamic instance) => instance.birth_day,
        r'powers': (dynamic instance) => instance.powers,
        r'today': (dynamic instance) => instance.today
      },
      {
        r'name=': (dynamic instance, value) => instance.name = value,
        r'gender=': (dynamic instance, value) => instance.gender = value,
        r'birth_day=': (dynamic instance, value) => instance.birth_day = value
      },
      null,
      [])
};

final _memberSymbolMap = null;

void initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}
