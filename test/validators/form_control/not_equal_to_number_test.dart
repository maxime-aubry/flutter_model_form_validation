import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('NotEqualToNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        NotEqualToNumberWithUserAndDeveloperValuesTest model =
            new NotEqualToNumberWithUserAndDeveloperValuesTest(10, 11);
        ModelFormState modelState =
            new ModelFormState<NotEqualToNumberWithUserAndDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        NotEqualToNumberWithUserValuesTest model =
            new NotEqualToNumberWithUserValuesTest(10, 11);
        ModelFormState modelState =
            new ModelFormState<NotEqualToNumberWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        NotEqualToNumberWithDeveloperValuesTest model =
            new NotEqualToNumberWithDeveloperValuesTest(2);
        ModelFormState modelState =
            new ModelFormState<NotEqualToNumberWithDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to value to compare.', () async {
        NotEqualToNumberTest model = new NotEqualToNumberTest(1, 2);
        ModelFormState modelState =
            new ModelFormState<NotEqualToNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is not equal to value to compare.', () async {
        NotEqualToNumberTest model = new NotEqualToNumberTest(1, 1);
        ModelFormState modelState =
            new ModelFormState<NotEqualToNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, NotEqualToNumber);
        expect(error.message, 'error message here');
      });
    });
  });
}
