import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models_outside_of_library.dart';

void main() {
  group('FormDeclarers.', () {
    group('FormControlElement.', () {
      test(
          'FormControlElement class with DateTime type is corretly instanciated.',
          () {
        FormControlElement formControl =
            new FormControlElement<DateTime>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test(
          'FormControlElement class with String type is corretly instanciated.',
          () {
        FormControlElement formControl =
            new FormControlElement<String>(null, 'test.models');

        expect(formControl, isNotNull);
        expect(formControl.value, isNull);
      });

      test(
          'FormControlElement class with EGender type does not instanciate. Bad library name.',
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
          'FormControlElement class with EFakeEnum type does not instanciate. Enum not defined into library.',
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
    });
  });
}
