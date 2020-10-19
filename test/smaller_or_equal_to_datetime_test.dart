import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/models.dart';
import 'models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('SmallerOrEqualToDatetime.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        SmallerOrEqualToDatetimeWithUserAndDeveloperValuesTest model =
            new SmallerOrEqualToDatetimeWithUserAndDeveloperValuesTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        ModelState modelState = new ModelState<
            SmallerOrEqualToDatetimeWithUserAndDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () async {
        SmallerOrEqualToDatetimeWithUserValuesTest model =
            new SmallerOrEqualToDatetimeWithUserValuesTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        ModelState modelState =
            new ModelState<SmallerOrEqualToDatetimeWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        SmallerOrEqualToDatetimeWithDeveloperValuesTest model =
            new SmallerOrEqualToDatetimeWithDeveloperValuesTest(
          new DateTime(2019, 1, 1),
        );
        ModelState modelState =
            new ModelState<SmallerOrEqualToDatetimeWithDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is smaller than value to compare.', () async {
        SmallerOrEqualToDatetimeTest model = new SmallerOrEqualToDatetimeTest(
          new DateTime(2019, 12, 31),
          new DateTime(2020, 1, 1),
        );
        ModelState modelState =
            new ModelState<SmallerOrEqualToDatetimeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('The value is equal to value to compare.', () async {
        SmallerOrEqualToDatetimeTest model = new SmallerOrEqualToDatetimeTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        ModelState modelState =
            new ModelState<SmallerOrEqualToDatetimeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is greater than value to compare.', () async {
        SmallerOrEqualToDatetimeTest model = new SmallerOrEqualToDatetimeTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        ModelState modelState =
            new ModelState<SmallerOrEqualToDatetimeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(
            modelState.errors['value'].validatorType, SmallerOrEqualToDateTime);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
