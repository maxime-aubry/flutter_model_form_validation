import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('NumberRange.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"Min" and "max" are provided by user and developer. User data has priority.',
          () {
        NumberRangeWithUserAndDeveloperValuesTest tester =
            new NumberRangeWithUserAndDeveloperValuesTest(5, 1, 10);
        bool isValid =
            ModelState.isValid<NumberRangeWithUserAndDeveloperValuesTest>(
                tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"Min" and "max" are provided by user only.', () {
        NumberRangeWithUserValuesTest tester =
            new NumberRangeWithUserValuesTest(5, 1, 10);
        bool isValid =
            ModelState.isValid<NumberRangeWithUserValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"Min" and "max" are provided by developer only.', () {
        NumberRangeWithDeveloperValuesTest tester =
            new NumberRangeWithDeveloperValuesTest(-5);
        bool isValid =
            ModelState.isValid<NumberRangeWithDeveloperValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to "min".', () {
        NumberRangeTest tester = new NumberRangeTest(1, 1, 10);
        bool isValid = ModelState.isValid<NumberRangeTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('The value is between "min" and "max".', () {
        NumberRangeTest tester = new NumberRangeTest(5, 1, 10);
        bool isValid = ModelState.isValid<NumberRangeTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('The value is equal to "max".', () {
        NumberRangeTest tester = new NumberRangeTest(10, 1, 10);
        bool isValid = ModelState.isValid<NumberRangeTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is smaller than "min".', () {
        NumberRangeTest tester = new NumberRangeTest(0, 1, 10);
        bool isValid = ModelState.isValid<NumberRangeTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, NumberRange);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error,
            'This Number is not in the range');
      });

      test('The value is greater than "max".', () {
        NumberRangeTest tester = new NumberRangeTest(11, 1, 10);
        bool isValid = ModelState.isValid<NumberRangeTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, NumberRange);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error,
            'This Number is not in the range');
      });
    });
  });
}
