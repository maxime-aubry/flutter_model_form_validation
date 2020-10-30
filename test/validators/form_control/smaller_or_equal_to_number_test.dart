import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('SmallerOrEqualToNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        SmallerOrEqualToNumberWithUserAndDeveloperValuesTest model =
            new SmallerOrEqualToNumberWithUserAndDeveloperValuesTest(10, 10);
        ModelFormState modelState = new ModelFormState<
            SmallerOrEqualToNumberWithUserAndDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        SmallerOrEqualToNumberWithUserValuesTest model =
            new SmallerOrEqualToNumberWithUserValuesTest(10, 10);
        ModelFormState modelState =
            new ModelFormState<SmallerOrEqualToNumberWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        SmallerOrEqualToNumberWithDeveloperValuesTest model =
            new SmallerOrEqualToNumberWithDeveloperValuesTest(1);
        ModelFormState modelState =
            new ModelFormState<SmallerOrEqualToNumberWithDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is smaller than value to compare.', () async {
        SmallerOrEqualToNumberTest model =
            new SmallerOrEqualToNumberTest(1, 12);
        ModelFormState modelState =
            new ModelFormState<SmallerOrEqualToNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('The value is equal to value to compare.', () async {
        SmallerOrEqualToNumberTest model = new SmallerOrEqualToNumberTest(1, 1);
        ModelFormState modelState =
            new ModelFormState<SmallerOrEqualToNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is greater than value to compare.', () async {
        SmallerOrEqualToNumberTest model = new SmallerOrEqualToNumberTest(1, 0);
        ModelFormState modelState =
            new ModelFormState<SmallerOrEqualToNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, SmallerOrEqualToNumber);
        expect(error.message, 'error message here');
      });
    });
  });
}
