import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('GreaterOrEqualToDatetime.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        GreaterOrEqualToDatetimeWithUserAndDeveloperValuesTest model =
            new GreaterOrEqualToDatetimeWithUserAndDeveloperValuesTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        ModelState<GreaterOrEqualToDatetimeWithUserAndDeveloperValuesTest>
            modelState = new ModelState<
                GreaterOrEqualToDatetimeWithUserAndDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        GreaterOrEqualToDatetimeWithUserValuesTest model =
            new GreaterOrEqualToDatetimeWithUserValuesTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        ModelState<GreaterOrEqualToDatetimeWithUserValuesTest> modelState =
            new ModelState<GreaterOrEqualToDatetimeWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        GreaterOrEqualToDatetimeWithDeveloperValuesTest model =
            new GreaterOrEqualToDatetimeWithDeveloperValuesTest(
          new DateTime(2019, 1, 1),
        );
        ModelState<GreaterOrEqualToDatetimeWithDeveloperValuesTest> modelState =
            new ModelState<GreaterOrEqualToDatetimeWithDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is greater than value to compare.', () async {
        GreaterOrEqualToDatetimeTest model = new GreaterOrEqualToDatetimeTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        ModelState<GreaterOrEqualToDatetimeTest> modelState =
            new ModelState<GreaterOrEqualToDatetimeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('The value is equal to value to compare.', () async {
        GreaterOrEqualToDatetimeTest model = new GreaterOrEqualToDatetimeTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        ModelState<GreaterOrEqualToDatetimeTest> modelState =
            new ModelState<GreaterOrEqualToDatetimeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is smaller than value to compare.', () async {
        GreaterOrEqualToDatetimeTest model = new GreaterOrEqualToDatetimeTest(
          new DateTime(2019, 12, 31),
          new DateTime(2020, 1, 1),
        );
        ModelState<GreaterOrEqualToDatetimeTest> modelState =
            new ModelState<GreaterOrEqualToDatetimeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, GreaterOrEqualToDateTime);
        expect(error.message, 'error message here');
      });
    });
  });
}
