import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('GreaterThanString.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        GreaterThanStringWithUserAndDeveloperValuesTest model =
            new GreaterThanStringWithUserAndDeveloperValuesTest('d', 'c');
        ModelState<GreaterThanStringWithUserAndDeveloperValuesTest> modelState =
            new ModelState<GreaterThanStringWithUserAndDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        GreaterThanStringWithUserValuesTest model =
            new GreaterThanStringWithUserValuesTest('d', 'c');
        ModelState<GreaterThanStringWithUserValuesTest> modelState =
            new ModelState<GreaterThanStringWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        GreaterThanStringWithDeveloperValuesTest model =
            new GreaterThanStringWithDeveloperValuesTest('c');
        ModelState<GreaterThanStringWithDeveloperValuesTest> modelState =
            new ModelState<GreaterThanStringWithDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is greater than value to compare.', () async {
        GreaterThanStringTest model = new GreaterThanStringTest('c', 'b');
        ModelState<GreaterThanStringTest> modelState =
            new ModelState<GreaterThanStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is equal to value to compare.', () async {
        GreaterThanStringTest model = new GreaterThanStringTest('b', 'b');
        ModelState<GreaterThanStringTest> modelState =
            new ModelState<GreaterThanStringTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, GreaterThanString);
        expect(error.message, 'error message here');
      });

      test('The value is not equal to value to compare.', () async {
        GreaterThanStringTest model = new GreaterThanStringTest('a', 'b');
        ModelState<GreaterThanStringTest> modelState =
            new ModelState<GreaterThanStringTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, GreaterThanString);
        expect(error.message, 'error message here');
      });
    });
  });
}
