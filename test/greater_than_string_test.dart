import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('GreaterThanString.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () {
        GreaterThanStringWithUserAndDeveloperValuesTest tester =
            new GreaterThanStringWithUserAndDeveloperValuesTest('d', 'c');
        bool isValid =
            ModelState.isValid<GreaterThanStringWithUserAndDeveloperValuesTest>(
                tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () {
        GreaterThanStringWithUserValuesTest tester =
            new GreaterThanStringWithUserValuesTest('d', 'c');
        bool isValid =
            ModelState.isValid<GreaterThanStringWithUserValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () {
        GreaterThanStringWithDeveloperValuesTest tester =
            new GreaterThanStringWithDeveloperValuesTest('c');
        bool isValid =
            ModelState.isValid<GreaterThanStringWithDeveloperValuesTest>(
                tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is greater than value to compare.', () {
        GreaterThanStringTest tester = new GreaterThanStringTest('c', 'b');
        bool isValid = ModelState.isValid<GreaterThanStringTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is equal to value to compare.', () {
        GreaterThanStringTest tester = new GreaterThanStringTest('b', 'b');
        bool isValid = ModelState.isValid<GreaterThanStringTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, GreaterThanString);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });

      test('The value is not equal to value to compare.', () {
        GreaterThanStringTest tester = new GreaterThanStringTest('a', 'b');
        bool isValid = ModelState.isValid<GreaterThanStringTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, GreaterThanString);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
