import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('SmallerThanNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        SmallerThanNumberWithUserAndDeveloperValuesTest model =
            new SmallerThanNumberWithUserAndDeveloperValuesTest(10, 11);
        ModelFormState modelState =
            new ModelFormState<SmallerThanNumberWithUserAndDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        SmallerThanNumberWithUserValuesTest model =
            new SmallerThanNumberWithUserValuesTest(10, 11);
        ModelFormState modelState =
            new ModelFormState<SmallerThanNumberWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        SmallerThanNumberWithDeveloperValuesTest model =
            new SmallerThanNumberWithDeveloperValuesTest(0);
        ModelFormState modelState =
            new ModelFormState<SmallerThanNumberWithDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is smaller than value to compare.', () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(1, 2);
        ModelFormState modelState =
            new ModelFormState<SmallerThanNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is equal to value to compare.', () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(1, 1);
        ModelFormState modelState =
            new ModelFormState<SmallerThanNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, SmallerThanNumber);
        expect(error.message, 'error message here');
      });

      test('The value is smaller than value to compare.', () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(1, 0);
        ModelFormState modelState =
            new ModelFormState<SmallerThanNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, SmallerThanNumber);
        expect(error.message, 'error message here');
      });
    });
  });
}
