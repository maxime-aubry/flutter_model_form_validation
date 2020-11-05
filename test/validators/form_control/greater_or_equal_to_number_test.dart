import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('GreaterOrEqualToNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        GreaterOrEqualToNumberWithUserAndDeveloperValuesTest model =
            new GreaterOrEqualToNumberWithUserAndDeveloperValuesTest(10, 10);
        ModelFormState<GreaterOrEqualToNumberWithUserAndDeveloperValuesTest>
            modelState = new ModelFormState<
                GreaterOrEqualToNumberWithUserAndDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        GreaterOrEqualToNumberWithUserValuesTest model =
            new GreaterOrEqualToNumberWithUserValuesTest(10, 10);
        ModelFormState<GreaterOrEqualToNumberWithUserValuesTest> modelState =
            new ModelFormState<GreaterOrEqualToNumberWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        GreaterOrEqualToNumberWithDeveloperValuesTest model =
            new GreaterOrEqualToNumberWithDeveloperValuesTest(1);
        ModelFormState<GreaterOrEqualToNumberWithDeveloperValuesTest>
            modelState =
            new ModelFormState<GreaterOrEqualToNumberWithDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is greater than value to compare.', () async {
        GreaterOrEqualToNumberTest model = new GreaterOrEqualToNumberTest(2, 1);
        ModelFormState<GreaterOrEqualToNumberTest> modelState =
            new ModelFormState<GreaterOrEqualToNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('The value is equal to value to compare.', () async {
        GreaterOrEqualToNumberTest model = new GreaterOrEqualToNumberTest(1, 1);
        ModelFormState<GreaterOrEqualToNumberTest> modelState =
            new ModelFormState<GreaterOrEqualToNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is smaller than value to compare.', () async {
        GreaterOrEqualToNumberTest model = new GreaterOrEqualToNumberTest(0, 1);
        ModelFormState<GreaterOrEqualToNumberTest> modelState =
            new ModelFormState<GreaterOrEqualToNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, GreaterOrEqualToNumber);
        expect(error.message, 'error message here');
      });
    });
  });
}
