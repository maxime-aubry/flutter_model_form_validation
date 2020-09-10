import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('SmallerThanNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () {
        SmallerThanNumberWithUserAndDeveloperValuesTest tester =
            new SmallerThanNumberWithUserAndDeveloperValuesTest(10, 11);
        bool isValid =
            ModelState.isValid<SmallerThanNumberWithUserAndDeveloperValuesTest>(
                tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () {
        SmallerThanNumberWithUserValuesTest tester =
            new SmallerThanNumberWithUserValuesTest(10, 11);
        bool isValid =
            ModelState.isValid<SmallerThanNumberWithUserValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () {
        SmallerThanNumberWithDeveloperValuesTest tester =
            new SmallerThanNumberWithDeveloperValuesTest(0);
        bool isValid =
            ModelState.isValid<SmallerThanNumberWithDeveloperValuesTest>(
                tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is smaller than value to compare.', () {
        SmallerThanNumberTest tester = new SmallerThanNumberTest(1, 2);
        bool isValid = ModelState.isValid<SmallerThanNumberTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is equal to value to compare.', () {
        SmallerThanNumberTest tester = new SmallerThanNumberTest(1, 1);
        bool isValid = ModelState.isValid<SmallerThanNumberTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, SmallerThanNumber);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });

      test('The value is smaller than value to compare.', () {
        SmallerThanNumberTest tester = new SmallerThanNumberTest(1, 0);
        bool isValid = ModelState.isValid<SmallerThanNumberTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, SmallerThanNumber);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
