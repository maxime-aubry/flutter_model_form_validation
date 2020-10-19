import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/models.dart';
import 'models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('SmallerThanNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        SmallerThanNumberWithUserAndDeveloperValuesTest model =
            new SmallerThanNumberWithUserAndDeveloperValuesTest(10, 11);
        ModelState modelState =
            new ModelState<SmallerThanNumberWithUserAndDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () async {
        SmallerThanNumberWithUserValuesTest model =
            new SmallerThanNumberWithUserValuesTest(10, 11);
        ModelState modelState =
            new ModelState<SmallerThanNumberWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        SmallerThanNumberWithDeveloperValuesTest model =
            new SmallerThanNumberWithDeveloperValuesTest(0);
        ModelState modelState =
            new ModelState<SmallerThanNumberWithDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is smaller than value to compare.', () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(1, 2);
        ModelState modelState = new ModelState<SmallerThanNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is equal to value to compare.', () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(1, 1);
        ModelState modelState = new ModelState<SmallerThanNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, SmallerThanNumber);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });

      test('The value is smaller than value to compare.', () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(1, 0);
        ModelState modelState = new ModelState<SmallerThanNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, SmallerThanNumber);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
