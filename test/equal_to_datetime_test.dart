import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('EqualToDatetime.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () {
        EqualToDatetimeWithUserAndDeveloperValuesTest tester =
            new EqualToDatetimeWithUserAndDeveloperValuesTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        bool isValid =
            ModelState.isValid<EqualToDatetimeWithUserAndDeveloperValuesTest>(
                tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () {
        EqualToDatetimeWithUserValuesTest tester =
            new EqualToDatetimeWithUserValuesTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        bool isValid =
            ModelState.isValid<EqualToDatetimeWithUserValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () {
        EqualToDatetimeWithDeveloperValuesTest tester =
            new EqualToDatetimeWithDeveloperValuesTest(
          new DateTime(2019, 1, 1),
        );
        bool isValid =
            ModelState.isValid<EqualToDatetimeWithDeveloperValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to value to compare.', () {
        EqualToDatetimeTest tester = new EqualToDatetimeTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        bool isValid = ModelState.isValid<EqualToDatetimeTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is not equal to value to compare.', () {
        EqualToDatetimeTest tester = new EqualToDatetimeTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        bool isValid = ModelState.isValid<EqualToDatetimeTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, EqualToDatetime);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
