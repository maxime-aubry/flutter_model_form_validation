import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/models.dart';
import 'models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('NotEqualToNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        NotEqualToNumberWithUserAndDeveloperValuesTest model =
            new NotEqualToNumberWithUserAndDeveloperValuesTest(10, 11);
        ModelState modelState =
            new ModelState<NotEqualToNumberWithUserAndDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () async {
        NotEqualToNumberWithUserValuesTest model =
            new NotEqualToNumberWithUserValuesTest(10, 11);
        ModelState modelState =
            new ModelState<NotEqualToNumberWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        NotEqualToNumberWithDeveloperValuesTest model =
            new NotEqualToNumberWithDeveloperValuesTest(2);
        ModelState modelState =
            new ModelState<NotEqualToNumberWithDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to value to compare.', () async {
        NotEqualToNumberTest model = new NotEqualToNumberTest(1, 2);
        ModelState modelState = new ModelState<NotEqualToNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is not equal to value to compare.', () async {
        NotEqualToNumberTest model = new NotEqualToNumberTest(1, 1);
        ModelState modelState = new ModelState<NotEqualToNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, NotEqualToNumber);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
