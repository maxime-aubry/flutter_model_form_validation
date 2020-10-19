import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/models.dart';
import 'models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('EqualToNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        EqualToNumberWithUserAndDeveloperValuesTest model =
            new EqualToNumberWithUserAndDeveloperValuesTest(10, 10);
        ModelState<EqualToNumberWithUserAndDeveloperValuesTest> modelState =
            new ModelState<EqualToNumberWithUserAndDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () async {
        EqualToNumberWithUserValuesTest model =
            new EqualToNumberWithUserValuesTest(10, 10);
        ModelState<EqualToNumberWithUserValuesTest> modelState =
            new ModelState<EqualToNumberWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        EqualToNumberWithDeveloperValuesTest model =
            new EqualToNumberWithDeveloperValuesTest(1);
        ModelState<EqualToNumberWithDeveloperValuesTest> modelState =
            new ModelState<EqualToNumberWithDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to value to compare.', () async {
        EqualToNumberTest model = new EqualToNumberTest(1, 1);
        ModelState<EqualToNumberTest> modelState =
            new ModelState<EqualToNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is not equal to value to compare.', () async {
        EqualToNumberTest model = new EqualToNumberTest(1, 2);
        ModelState<EqualToNumberTest> modelState =
            new ModelState<EqualToNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, EqualToNumber);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
