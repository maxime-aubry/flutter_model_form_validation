import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('GreaterOrEqualToString.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        GreaterOrEqualToStringWithUserAndDeveloperValuesTest model =
            new GreaterOrEqualToStringWithUserAndDeveloperValuesTest('c', 'c');
        ModelState<GreaterOrEqualToStringWithUserAndDeveloperValuesTest>
            modelState = new ModelState<
                GreaterOrEqualToStringWithUserAndDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        GreaterOrEqualToStringWithUserValuesTest model =
            new GreaterOrEqualToStringWithUserValuesTest('c', 'c');
        ModelState<GreaterOrEqualToStringWithUserValuesTest> modelState =
            new ModelState<GreaterOrEqualToStringWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        GreaterOrEqualToStringWithDeveloperValuesTest model =
            new GreaterOrEqualToStringWithDeveloperValuesTest('b');
        ModelState<GreaterOrEqualToStringWithDeveloperValuesTest> modelState =
            new ModelState<GreaterOrEqualToStringWithDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is greater than value to compare.', () async {
        GreaterOrEqualToStringTest model =
            new GreaterOrEqualToStringTest('c', 'b');
        ModelState<GreaterOrEqualToStringTest> modelState =
            new ModelState<GreaterOrEqualToStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('The value is equal to value to compare.', () async {
        GreaterOrEqualToStringTest model =
            new GreaterOrEqualToStringTest('b', 'b');
        ModelState<GreaterOrEqualToStringTest> modelState =
            new ModelState<GreaterOrEqualToStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is smaller than value to compare.', () async {
        GreaterOrEqualToStringTest model =
            new GreaterOrEqualToStringTest('a', 'b');
        ModelState<GreaterOrEqualToStringTest> modelState =
            new ModelState<GreaterOrEqualToStringTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, GreaterOrEqualToString);
        expect(error.message, 'error message here');
      });
    });
  });
}
