import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/models.dart';
import 'models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('NotEqualToString.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        NotEqualToStringWithUserAndDeveloperValuesTest model =
            new NotEqualToStringWithUserAndDeveloperValuesTest('a', 'b');
        ModelState modelState =
            new ModelState<NotEqualToStringWithUserAndDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () async {
        NotEqualToStringWithUserValuesTest model =
            new NotEqualToStringWithUserValuesTest('a', 'b');
        ModelState modelState =
            new ModelState<NotEqualToStringWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        NotEqualToStringWithDeveloperValuesTest model =
            new NotEqualToStringWithDeveloperValuesTest('c');
        ModelState modelState =
            new ModelState<NotEqualToStringWithDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to value to compare.', () async {
        NotEqualToStringTest model = new NotEqualToStringTest('a', 'b');
        ModelState modelState = new ModelState<NotEqualToStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is not equal to value to compare.', () async {
        NotEqualToStringTest model = new NotEqualToStringTest('a', 'a');
        ModelState modelState = new ModelState<NotEqualToStringTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, NotEqualToString);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
