import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('GreaterThanDatetime.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () {
        GreaterThanDatetimeWithUserAndDeveloperValuesTest tester =
            new GreaterThanDatetimeWithUserAndDeveloperValuesTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        bool isValid = ModelState.isValid<
            GreaterThanDatetimeWithUserAndDeveloperValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () {
        GreaterThanDatetimeWithUserValuesTest tester =
            new GreaterThanDatetimeWithUserValuesTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        bool isValid =
            ModelState.isValid<GreaterThanDatetimeWithUserValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () {
        GreaterThanDatetimeWithDeveloperValuesTest tester =
            new GreaterThanDatetimeWithDeveloperValuesTest(
          new DateTime(2019, 1, 2),
        );
        bool isValid =
            ModelState.isValid<GreaterThanDatetimeWithDeveloperValuesTest>(
                tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is greater than value to compare.', () {
        GreaterThanDatetimeTest tester = new GreaterThanDatetimeTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        bool isValid = ModelState.isValid<GreaterThanDatetimeTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is equal to value to compare.', () {
        GreaterThanDatetimeTest tester = new GreaterThanDatetimeTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        bool isValid = ModelState.isValid<GreaterThanDatetimeTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, GreaterThanDateTime);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });

      test('The value is smaller than value to compare.', () {
        GreaterThanDatetimeTest tester = new GreaterThanDatetimeTest(
          new DateTime(2019, 12, 31),
          new DateTime(2020, 1, 1),
        );
        bool isValid = ModelState.isValid<GreaterThanDatetimeTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, GreaterThanDateTime);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
