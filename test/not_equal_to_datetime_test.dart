import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/models.dart';
import 'models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('NotEqualToDatetime.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        NotEqualToDatetimeWithUserAndDeveloperValuesTest model =
            new NotEqualToDatetimeWithUserAndDeveloperValuesTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        ModelState modelState =
            new ModelState<NotEqualToDatetimeWithUserAndDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () async {
        NotEqualToDatetimeWithUserValuesTest model =
            new NotEqualToDatetimeWithUserValuesTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        ModelState modelState =
            new ModelState<NotEqualToDatetimeWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        NotEqualToDatetimeWithDeveloperValuesTest model =
            new NotEqualToDatetimeWithDeveloperValuesTest(
          new DateTime(2019, 1, 2),
        );
        ModelState modelState =
            new ModelState<NotEqualToDatetimeWithDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to value to compare.', () async {
        NotEqualToDatetimeTest model = new NotEqualToDatetimeTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        ModelState modelState = new ModelState<NotEqualToDatetimeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is not equal to value to compare.', () async {
        NotEqualToDatetimeTest model = new NotEqualToDatetimeTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        ModelState modelState = new ModelState<NotEqualToDatetimeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, NotEqualToDateTime);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
