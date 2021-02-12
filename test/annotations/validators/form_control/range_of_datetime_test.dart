import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/range_of_datetime.dart';

void main() {
  setUp(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('RangeOfDateTime.', () {
    test(
        'RangeOfDateTime validator returns True (reason: value is equal to min).',
        () async {
      RangeOfDateTime_ValueEqualToMin_Stub stub =
          new RangeOfDateTime_ValueEqualToMin_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test(
        'RangeOfDateTime validator returns True (reason: value is equal to max).',
        () async {
      RangeOfDateTime_ValueEqualToMax_Stub stub =
          new RangeOfDateTime_ValueEqualToMax_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test(
        'RangeOfDateTime validator returns True (reason: value is between min and max).',
        () async {
      RangeOfDateTime_ValueBetweenMinAndMax_Stub stub =
          new RangeOfDateTime_ValueBetweenMinAndMax_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test(
        'RangeOfDateTime validator returns True (reason: external min and max are ok).',
        () async {
      RangeOfDateTime_WithExternalMinMax_Stub stub =
          new RangeOfDateTime_WithExternalMinMax_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test(
        'RangeOfDateTime validator returns False (reason: value is smaller than min).',
        () async {
      RangeOfDateTime_ValueBeforeMin_Stub stub =
          new RangeOfDateTime_ValueBeforeMin_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });

    test(
        'RangeOfDateTime validator returns False (reason: value is greater than max).',
        () async {
      RangeOfDateTime_ValueAfterMax_Stub stub =
          new RangeOfDateTime_ValueAfterMax_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });

    test('RangeOfDateTime validator returns False (reason: min is missing).',
        () async {
      RangeOfDateTime_WithMissingMin_Stub stub =
          new RangeOfDateTime_WithMissingMin_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();

      expect(
        () async {
          await validator.isValid(formControl);
        },
        throwsA(
          isA<ValidationException>().having((error) => error.message,
              'description', 'Min value is not defined.'),
        ),
      );
    });

    test('RangeOfDateTime validator returns False (reason: max is missing).',
        () async {
      RangeOfDateTime_WithMissingMax_Stub stub =
          new RangeOfDateTime_WithMissingMax_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();

      expect(
        () async {
          await validator.isValid(formControl);
        },
        throwsA(
          isA<ValidationException>().having((error) => error.message,
              'description', 'Max value is not defined.'),
        ),
      );
    });

    test(
        'RangeOfDateTime validator returns False (reason: min is greater than max).',
        () async {
      RangeOfDateTime_MinGreatherThanMax_Stub stub =
          new RangeOfDateTime_MinGreatherThanMax_Stub();
      FormControl<DateTime> formControl = stub.getControl();
      RangeOfDateTime validator = stub.getValidator();

      expect(
        () async {
          await validator.isValid(formControl);
        },
        throwsA(
          isA<ValidationException>().having((error) => error.message,
              'description', 'Min value is greater than max value.'),
        ),
      );
    });
  });
}
