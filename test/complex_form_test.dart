import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/form_property.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/models.dart';
import 'models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('ComplexForm.', () {
    group('Test the validation > success.', () {
      test('Form is pure with no data. Add data. Form is valid.', () async {
        ComplexFormTest model = new ComplexFormTest(null, null, null, null);
        ModelState<ComplexFormTest> modelState =
            new ModelState<ComplexFormTest>(model);

        expect(modelState.status, FormStatus.pure);
        expect(modelState.getProperty('firstName').status, InputStatus.pure);
        expect(modelState.getProperty('lastName').status, InputStatus.pure);
        expect(modelState.getProperty('birthDay').status, InputStatus.pure);
        expect(modelState.getProperty('dateOfDeath').status, InputStatus.pure);
        expect(await modelState.validateForm(), false);

        model.first_name = 'Edouard';
        model.last_name = 'Elric';
        model.birth_day = new DateTime(1980, 12, 15);
        model.date_of_death = new DateTime(2019, 06, 01);
        await Future.delayed(const Duration(seconds: 1), () {});
        expect(modelState.getProperty('firstName').status, InputStatus.valid);
        expect(modelState.getProperty('lastName').status, InputStatus.valid);
        expect(modelState.getProperty('birthDay').status, InputStatus.valid);
        expect(modelState.getProperty('dateOfDeath').status, InputStatus.valid);
        expect(await modelState.validateForm(), true);
      });

      test('Form is pure with pre-entered data. Form is valid.', () {
        ComplexFormTest model = new ComplexFormTest(
          'Edouard',
          'Elric',
          new DateTime(1980, 12, 15),
          new DateTime(2019, 12, 31),
        );
        ModelState<ComplexFormTest> modelState =
            new ModelState<ComplexFormTest>(model);

        expect(modelState.status, FormStatus.pure);
        expect(modelState.getProperty('firstName').status, InputStatus.pure);
        expect(modelState.getProperty('lastName').status, InputStatus.pure);
        expect(modelState.getProperty('birthDay').status, InputStatus.pure);
        expect(modelState.getProperty('dateOfDeath').status, InputStatus.pure);
        expect(modelState.validateForm(), true);
      });
    });

    group('Test the validation > failure.', () {
      test('Form is pure with no data. Form is invalid.', () {
        ComplexFormTest model = new ComplexFormTest(null, null, null, null);
        ModelState<ComplexFormTest> modelState =
            new ModelState<ComplexFormTest>(model);

        expect(modelState.status, FormStatus.pure);
        expect(modelState.getProperty('firstName').status, InputStatus.pure);
        expect(modelState.getProperty('lastName').status, InputStatus.pure);
        expect(modelState.getProperty('birthDay').status, InputStatus.pure);
        expect(modelState.getProperty('dateOfDeath').status, InputStatus.pure);
        expect(modelState.validateForm(), false);
      });

      test('Form is pure with pre-entered data. Form is invalid.', () {
        ComplexFormTest model = new ComplexFormTest(
          'Edouard',
          'Elric',
          new DateTime(1980, 12, 15),
          new DateTime(2019, 06, 01),
        );
        ModelState<ComplexFormTest> modelState =
            new ModelState<ComplexFormTest>(model);

        expect(modelState.status, FormStatus.pure);
        expect(modelState.getProperty('firstName').status, InputStatus.pure);
        expect(modelState.getProperty('firstName').error, isNull);
        expect(modelState.getProperty('lastName').status, InputStatus.pure);
        expect(modelState.getProperty('lastName').error, isNull);
        expect(modelState.getProperty('birthDay').status, InputStatus.pure);
        expect(modelState.getProperty('birthDay').error, isNull);
        expect(modelState.getProperty('dateOfDeath').status, InputStatus.pure);
        expect(modelState.getProperty('dateOfDeath').error, isNull);
        expect(modelState.validateForm(), false);
      });

      test('Form is completed by user. Form is invalid.', () {
        ComplexFormTest model = new ComplexFormTest(null, null, null, null);
        ModelState<ComplexFormTest> modelState =
            new ModelState<ComplexFormTest>(model);

        model.first_name = 'Ed';
        model.last_name = null;
        model.birth_day = new DateTime(1980, 12, 15);
        model.date_of_death = new DateTime(2020, 01, 02);

        expect(modelState.status, FormStatus.invalid);
        expect(modelState.getProperty('firstName').status, InputStatus.invalid);
        expect(modelState.getProperty('firstName').error, isNotNull);
        expect(modelState.getProperty('firstName').error.error,
            'Invalid string length');
        expect(modelState.getProperty('lastName').status, InputStatus.invalid);
        expect(modelState.getProperty('lastName').error, isNotNull);
        expect(modelState.getProperty('lastName').error.error,
            'lastname is required');
        expect(modelState.getProperty('birthDay').status, InputStatus.valid);
        expect(modelState.getProperty('birthDay').error, isNull);
        expect(
            modelState.getProperty('dateOfDeath').status, InputStatus.invalid);
        expect(modelState.getProperty('dateOfDeath').error, isNotNull);
        expect(modelState.getProperty('dateOfDeath').error.error,
            'date of death must be smaller or equal than 2020-01-01');

        model.date_of_death = new DateTime(1980, 12, 14);

        expect(
            modelState.getProperty('dateOfDeath').status, InputStatus.invalid);
        expect(modelState.getProperty('dateOfDeath').error, isNotNull);
        expect(modelState.getProperty('dateOfDeath').error.error,
            'date of death must be greater or equal to birthday');
        expect(modelState.validateForm(), false);
      });
    });
  });
}
