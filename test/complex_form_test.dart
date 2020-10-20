import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/models.dart';
import 'models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('ComplexForm.', () {
    group('Test the validation > success.', () {
      test('Form is pure with no data. Add data.', () async {
        ComplexFormTest model = new ComplexFormTest(null, null, null, null);
        ModelState<ComplexFormTest> modelState =
            new ModelState<ComplexFormTest>(model);

        model.first_name = 'Edouard';
        await Future.delayed(const Duration(microseconds: 100), () {});

        model.last_name = 'Elric';
        await Future.delayed(const Duration(microseconds: 100), () {});

        model.birth_day = new DateTime(1980, 12, 15);
        await Future.delayed(const Duration(microseconds: 100), () {});

        model.date_of_death = new DateTime(2019, 06, 01);
        await Future.delayed(const Duration(microseconds: 100), () {});

        expect(modelState.getProperty('first_name').status, InputStatus.valid);
        expect(modelState.getProperty('last_name').status, InputStatus.valid);
        expect(modelState.getProperty('birth_day').status, InputStatus.valid);
        expect(
            modelState.getProperty('date_of_death').status, InputStatus.valid);
        expect(await modelState.validateForm(), true);
      });

      test('Form is pure with pre-entered data.', () async {
        ComplexFormTest model = new ComplexFormTest(
          'Edouard',
          'Elric',
          new DateTime(1980, 12, 15),
          new DateTime(2019, 12, 31),
        );
        ModelState<ComplexFormTest> modelState =
            new ModelState<ComplexFormTest>(model);

        expect(modelState.status, FormStatus.pure);
        expect(modelState.getProperty('first_name').status, InputStatus.pure);
        expect(modelState.getProperty('last_name').status, InputStatus.pure);
        expect(modelState.getProperty('birth_day').status, InputStatus.pure);
        expect(
            modelState.getProperty('date_of_death').status, InputStatus.pure);
        expect(await modelState.validateForm(), true);
      });
    });

    group('Test the validation > failure.', () {
      test('Form is pure with no data', () async {
        ComplexFormTest model = new ComplexFormTest(null, null, null, null);
        ModelState<ComplexFormTest> modelState =
            new ModelState<ComplexFormTest>(model);

        expect(modelState.status, FormStatus.pure);
        expect(modelState.getProperty('first_name').status, InputStatus.pure);
        expect(modelState.getProperty('last_name').status, InputStatus.pure);
        expect(modelState.getProperty('birth_day').status, InputStatus.pure);
        expect(
            modelState.getProperty('date_of_death').status, InputStatus.pure);
        expect(await modelState.validateForm(), false);
      });

      test('Form is pure with pre-entered data', () async {
        ComplexFormTest model = new ComplexFormTest(
          'Edouard',
          'Elric',
          new DateTime(1980, 12, 15),
          new DateTime(2020, 01, 02),
        );
        ModelState<ComplexFormTest> modelState =
            new ModelState<ComplexFormTest>(model);

        expect(modelState.status, FormStatus.pure);
        expect(modelState.getProperty('first_name').status, InputStatus.pure);
        expect(modelState.getProperty('first_name').error, isNull);
        expect(modelState.getProperty('last_name').status, InputStatus.pure);
        expect(modelState.getProperty('last_name').error, isNull);
        expect(modelState.getProperty('birth_day').status, InputStatus.pure);
        expect(modelState.getProperty('birth_day').error, isNull);
        expect(
            modelState.getProperty('date_of_death').status, InputStatus.pure);
        expect(modelState.getProperty('date_of_death').error, isNull);
        expect(await modelState.validateForm(), false);
      });

      test('Form is completed by user', () async {
        ComplexFormTest model = new ComplexFormTest(null, null, null, null);
        ModelState<ComplexFormTest> modelState =
            new ModelState<ComplexFormTest>(model);

        model.first_name = 'Ed';
        await Future.delayed(const Duration(microseconds: 100), () {});

        model.last_name = null;
        await Future.delayed(const Duration(microseconds: 100), () {});

        model.birth_day = new DateTime(1980, 12, 15);
        await Future.delayed(const Duration(microseconds: 100), () {});

        model.date_of_death = new DateTime(2020, 01, 02);
        await Future.delayed(const Duration(microseconds: 100), () {});

        expect(modelState.status, FormStatus.invalid);
        expect(
            modelState.getProperty('first_name').status, InputStatus.invalid);
        expect(modelState.getProperty('first_name').error, isNotNull);
        expect(modelState.getProperty('first_name').error.error,
            'Invalid string length');
        expect(modelState.getProperty('last_name').status, InputStatus.invalid);
        expect(modelState.getProperty('last_name').error, isNotNull);
        expect(modelState.getProperty('last_name').error.error,
            'lastname is required');
        expect(modelState.getProperty('birth_day').status, InputStatus.valid);
        expect(modelState.getProperty('birth_day').error, isNull);
        expect(modelState.getProperty('date_of_death').status,
            InputStatus.invalid);
        expect(modelState.getProperty('date_of_death').error, isNotNull);
        expect(modelState.getProperty('date_of_death').error.error,
            'date of death must be smaller or equal than 2020-01-01');

        model.date_of_death = new DateTime(1980, 12, 14);
        await Future.delayed(const Duration(seconds: 1), () {});

        expect(modelState.getProperty('date_of_death').status,
            InputStatus.invalid);
        expect(modelState.getProperty('date_of_death').error, isNotNull);
        expect(modelState.getProperty('date_of_death').error.error,
            'date of death must be greater or equal to birthday');
        expect(await modelState.validateForm(), false);
      });
    });
  });
}
