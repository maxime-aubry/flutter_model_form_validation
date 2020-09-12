import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('NotEqualToString.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () {
        NotEqualToStringWithUserAndDeveloperValuesTest tester =
            new NotEqualToStringWithUserAndDeveloperValuesTest('a', 'b');
        bool isValid =
            ModelState.isValid<NotEqualToStringWithUserAndDeveloperValuesTest>(
                tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () {
        NotEqualToStringWithUserValuesTest tester =
            new NotEqualToStringWithUserValuesTest('a', 'b');
        bool isValid =
            ModelState.isValid<NotEqualToStringWithUserValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () {
        NotEqualToStringWithDeveloperValuesTest tester =
            new NotEqualToStringWithDeveloperValuesTest('c');
        bool isValid =
            ModelState.isValid<NotEqualToStringWithDeveloperValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to value to compare.', () {
        NotEqualToStringTest tester = new NotEqualToStringTest('a', 'b');
        bool isValid = ModelState.isValid<NotEqualToStringTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is not equal to value to compare.', () {
        NotEqualToStringTest tester = new NotEqualToStringTest('a', 'a');
        bool isValid = ModelState.isValid<NotEqualToStringTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, NotEqualToString);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
