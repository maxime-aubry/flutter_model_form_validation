import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/models.dart';
import 'models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('SmallerThanString.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        SmallerThanStringWithUserAndDeveloperValuesTest model =
            new SmallerThanStringWithUserAndDeveloperValuesTest('c', 'd');
        ModelState modelState =
            new ModelState<SmallerThanStringWithUserAndDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () async {
        SmallerThanStringWithUserValuesTest model =
            new SmallerThanStringWithUserValuesTest('c', 'd');
        ModelState modelState =
            new ModelState<SmallerThanStringWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        SmallerThanStringWithDeveloperValuesTest model =
            new SmallerThanStringWithDeveloperValuesTest('a');
        ModelState modelState =
            new ModelState<SmallerThanStringWithDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is smaller than value to compare.', () async {
        SmallerThanStringTest model = new SmallerThanStringTest('b', 'c');
        ModelState modelState = new ModelState<SmallerThanStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is equal to value to compare.', () async {
        SmallerThanStringTest model = new SmallerThanStringTest('b', 'b');
        ModelState modelState = new ModelState<SmallerThanStringTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, SmallerThanString);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });

      test('The value is not equal to value to compare.', () async {
        SmallerThanStringTest model = new SmallerThanStringTest('b', 'a');
        ModelState modelState = new ModelState<SmallerThanStringTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, SmallerThanString);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
