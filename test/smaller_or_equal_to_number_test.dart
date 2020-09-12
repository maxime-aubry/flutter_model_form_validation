import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('SmallerOrEqualToNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () {
        SmallerOrEqualToNumberWithUserAndDeveloperValuesTest tester =
            new SmallerOrEqualToNumberWithUserAndDeveloperValuesTest(10, 10);
        bool isValid = ModelState.isValid<
            SmallerOrEqualToNumberWithUserAndDeveloperValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () {
        SmallerOrEqualToNumberWithUserValuesTest tester =
            new SmallerOrEqualToNumberWithUserValuesTest(10, 10);
        bool isValid =
            ModelState.isValid<SmallerOrEqualToNumberWithUserValuesTest>(
                tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () {
        SmallerOrEqualToNumberWithDeveloperValuesTest tester =
            new SmallerOrEqualToNumberWithDeveloperValuesTest(1);
        bool isValid =
            ModelState.isValid<SmallerOrEqualToNumberWithDeveloperValuesTest>(
                tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is smaller than value to compare.', () {
        SmallerOrEqualToNumberTest tester =
            new SmallerOrEqualToNumberTest(1, 12);
        bool isValid = ModelState.isValid<SmallerOrEqualToNumberTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('The value is equal to value to compare.', () {
        SmallerOrEqualToNumberTest tester =
            new SmallerOrEqualToNumberTest(1, 1);
        bool isValid = ModelState.isValid<SmallerOrEqualToNumberTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is greater than value to compare.', () {
        SmallerOrEqualToNumberTest tester =
            new SmallerOrEqualToNumberTest(1, 0);
        bool isValid = ModelState.isValid<SmallerOrEqualToNumberTest>(tester);
        expect(isValid, false);

        expect(
            ModelState.errors['value'].validatorType, SmallerOrEqualToNumber);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
