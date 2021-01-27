import 'dart:ffi';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';
import '../models/models_outside_of_library.dart';

void main() {
  initializeReflectable();

  group('FormDeclarers.', () {
    group('FormControlElement.', () {
      test(
          'FormControlElement object with DateTime type is safely instanciated.',
          () {
        FormControlElement<DateTime> formControl =
            new FormControlElement<DateTime>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test('FormControlElement object with num type is safely instanciated.',
          () {
        FormControlElement<num> formControl =
            new FormControlElement<num>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test('FormControlElement object with int type is safely instanciated.',
          () {
        FormControlElement<int> formControl =
            new FormControlElement<int>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test('FormControlElement object with double type is safely instanciated.',
          () {
        FormControlElement<double> formControl =
            new FormControlElement<double>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test('FormControlElement object with Uint8 type is safely instanciated.',
          () {
        FormControlElement<Uint8> formControl =
            new FormControlElement<Uint8>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test('FormControlElement object with Uint16 type is safely instanciated.',
          () {
        FormControlElement<Uint16> formControl =
            new FormControlElement<Uint16>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test('FormControlElement object with Uint32 type is safely instanciated.',
          () {
        FormControlElement<Uint32> formControl =
            new FormControlElement<Uint32>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test('FormControlElement object with Uint64 type is safely instanciated.',
          () {
        FormControlElement<Uint64> formControl =
            new FormControlElement<Uint64>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test('FormControlElement object with Int8 type is safely instanciated.',
          () {
        FormControlElement<Int8> formControl =
            new FormControlElement<Int8>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test('FormControlElement object with Int16 type is safely instanciated.',
          () {
        FormControlElement<Int16> formControl =
            new FormControlElement<Int16>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test('FormControlElement object with Int32 type is safely instanciated.',
          () {
        FormControlElement<Int32> formControl =
            new FormControlElement<Int32>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test('FormControlElement object with Int64 type is safely instanciated.',
          () {
        FormControlElement<Int64> formControl =
            new FormControlElement<Int64>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test('FormControlElement object with String type is safely instanciated.',
          () {
        FormControlElement<String> formControl =
            new FormControlElement<String>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test('FormControlElement object with bool type is safely instanciated.',
          () {
        FormControlElement<bool> formControl =
            new FormControlElement<bool>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test(
          'FormControlElement object with enum type (EGender) is safely instanciated.',
          () {
        FormControlElement<EGender> formControl =
            new FormControlElement<EGender>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test(
          'FormControlElement object with enum type (EFakeEnum) does not instanciate. Bad library name.',
          () {
        expect(
          () {
            new FormControlElement<EFakeEnum>(null, 'bad.library.name');
          },
          throwsA(
            isA<AssertionError>().having(
              (error) => error.message,
              'description',
              'Cannot instanciate a FormControlElement with a not allowed type. Allowed types are : DateTime, num, int, double, Uint8, Uint16, Uint32, Uint64, Int8, Int16, Int32, Int64, String, bool, enums, List<DateTime>, List<num>, List<int>, List<double>, Uint8List, Uint16List, Uint32List, Uint64List, Int8List, Int16List, Int32List, Int64List, List<String>, List<bool> and a list of enum.',
            ),
          ),
        );
      });

      test(
          'FormControlElement object with enum type (EFakeEnum) does not instanciate. Enum not defined into library.',
          () {
        expect(
          () {
            new FormControlElement<EFakeEnum>(null, 'test.models');
          },
          throwsA(
            isA<AssertionError>().having(
              (error) => error.message,
              'description',
              'Cannot instanciate a FormControlElement with a not allowed type. Allowed types are : DateTime, num, int, double, Uint8, Uint16, Uint32, Uint64, Int8, Int16, Int32, Int64, String, bool, enums, List<DateTime>, List<num>, List<int>, List<double>, Uint8List, Uint16List, Uint32List, Uint64List, Int8List, Int16List, Int32List, Int64List, List<String>, List<bool> and a list of enum.',
            ),
          ),
        );
      });

      test(
          'FormControlElement object is safely instanciated. Listener updates the value.',
          () {
        FormControlElement<String> formControl =
            new FormControlElement<String>(null, 'test.models');
        String result;

        formControl.addListener(() {
          result = formControl.value;
        });

        expect(formControl.value, isNull);
        formControl.value = 'azerty';
        expect(formControl.value, isNotNull);
        expect(formControl.value, result);
      });
    });
  });
}
