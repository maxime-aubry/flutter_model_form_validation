import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/models.dart';
import 'models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('GreaterThanDatetime.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        GreaterThanDatetimeWithUserAndDeveloperValuesTest model =
            new GreaterThanDatetimeWithUserAndDeveloperValuesTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        ModelState<GreaterThanDatetimeWithUserAndDeveloperValuesTest>
            modelState =
            new ModelState<GreaterThanDatetimeWithUserAndDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () async {
        GreaterThanDatetimeWithUserValuesTest model =
            new GreaterThanDatetimeWithUserValuesTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        ModelState<GreaterThanDatetimeWithUserValuesTest> modelState =
            new ModelState<GreaterThanDatetimeWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        GreaterThanDatetimeWithDeveloperValuesTest model =
            new GreaterThanDatetimeWithDeveloperValuesTest(
          new DateTime(2019, 1, 2),
        );
        ModelState<GreaterThanDatetimeWithDeveloperValuesTest> modelState =
            new ModelState<GreaterThanDatetimeWithDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is greater than value to compare.', () async {
        GreaterThanDatetimeTest model = new GreaterThanDatetimeTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        ModelState<GreaterThanDatetimeTest> modelState =
            new ModelState<GreaterThanDatetimeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is equal to value to compare.', () async {
        GreaterThanDatetimeTest model = new GreaterThanDatetimeTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        ModelState<GreaterThanDatetimeTest> modelState =
            new ModelState<GreaterThanDatetimeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, GreaterThanDateTime);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });

      test('The value is smaller than value to compare.', () async {
        GreaterThanDatetimeTest model = new GreaterThanDatetimeTest(
          new DateTime(2019, 12, 31),
          new DateTime(2020, 1, 1),
        );
        ModelState<GreaterThanDatetimeTest> modelState =
            new ModelState<GreaterThanDatetimeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, GreaterThanDateTime);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
