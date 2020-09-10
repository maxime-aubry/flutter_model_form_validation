import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('NotEqualToDatetime.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () {
        NotEqualToDatetimeWithUserAndDeveloperValuesTest tester =
            new NotEqualToDatetimeWithUserAndDeveloperValuesTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        bool isValid = ModelState.isValid<
            NotEqualToDatetimeWithUserAndDeveloperValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () {
        NotEqualToDatetimeWithUserValuesTest tester =
            new NotEqualToDatetimeWithUserValuesTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        bool isValid =
            ModelState.isValid<NotEqualToDatetimeWithUserValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () {
        NotEqualToDatetimeWithDeveloperValuesTest tester =
            new NotEqualToDatetimeWithDeveloperValuesTest(
          new DateTime(2019, 1, 2),
        );
        bool isValid =
            ModelState.isValid<NotEqualToDatetimeWithDeveloperValuesTest>(
                tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to value to compare.', () {
        NotEqualToDatetimeTest tester = new NotEqualToDatetimeTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        bool isValid = ModelState.isValid<NotEqualToDatetimeTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is not equal to value to compare.', () {
        NotEqualToDatetimeTest tester = new NotEqualToDatetimeTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        bool isValid = ModelState.isValid<NotEqualToDatetimeTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, NotEqualToDatetime);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
