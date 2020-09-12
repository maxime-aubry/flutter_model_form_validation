import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('EqualToNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () {
        EqualToNumberWithUserAndDeveloperValuesTest tester =
            new EqualToNumberWithUserAndDeveloperValuesTest(10, 10);
        bool isValid =
            ModelState.isValid<EqualToNumberWithUserAndDeveloperValuesTest>(
                tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () {
        EqualToNumberWithUserValuesTest tester =
            new EqualToNumberWithUserValuesTest(10, 10);
        bool isValid =
            ModelState.isValid<EqualToNumberWithUserValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () {
        EqualToNumberWithDeveloperValuesTest tester =
            new EqualToNumberWithDeveloperValuesTest(1);
        bool isValid =
            ModelState.isValid<EqualToNumberWithDeveloperValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to value to compare.', () {
        EqualToNumberTest tester = new EqualToNumberTest(1, 1);
        bool isValid = ModelState.isValid<EqualToNumberTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is not equal to value to compare.', () {
        EqualToNumberTest tester = new EqualToNumberTest(1, 2);
        bool isValid = ModelState.isValid<EqualToNumberTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, EqualToNumber);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
