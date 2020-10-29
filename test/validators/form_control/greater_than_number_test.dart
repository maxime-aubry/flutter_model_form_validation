import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('GreaterThanNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        GreaterThanNumberWithUserAndDeveloperValuesTest model =
            new GreaterThanNumberWithUserAndDeveloperValuesTest(11, 10);
        ModelState<GreaterThanNumberWithUserAndDeveloperValuesTest> modelState =
            new ModelState<GreaterThanNumberWithUserAndDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        GreaterThanNumberWithUserValuesTest model =
            new GreaterThanNumberWithUserValuesTest(11, 10);
        ModelState<GreaterThanNumberWithUserValuesTest> modelState =
            new ModelState<GreaterThanNumberWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        GreaterThanNumberWithDeveloperValuesTest model =
            new GreaterThanNumberWithDeveloperValuesTest(2);
        ModelState<GreaterThanNumberWithDeveloperValuesTest> modelState =
            new ModelState<GreaterThanNumberWithDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is greater than value to compare.', () async {
        GreaterThanNumberTest model = new GreaterThanNumberTest(2, 1);
        ModelState<GreaterThanNumberTest> modelState =
            new ModelState<GreaterThanNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is equal to value to compare.', () async {
        GreaterThanNumberTest model = new GreaterThanNumberTest(1, 1);
        ModelState<GreaterThanNumberTest> modelState =
            new ModelState<GreaterThanNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, GreaterThanNumber);
        expect(error.message, 'error message here');
      });

      test('The value is smaller than value to compare.', () async {
        GreaterThanNumberTest model = new GreaterThanNumberTest(0, 1);
        ModelState<GreaterThanNumberTest> modelState =
            new ModelState<GreaterThanNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, GreaterThanNumber);
        expect(error.message, 'error message here');
      });
    });
  });
}
