import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/models.dart';
import 'models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('EqualToString.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        EqualToStringWithUserAndDeveloperValuesTest model =
            new EqualToStringWithUserAndDeveloperValuesTest('a', 'a');
        ModelState<EqualToStringWithUserAndDeveloperValuesTest> modelState =
            new ModelState<EqualToStringWithUserAndDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by user only.', () async {
        EqualToStringWithUserValuesTest model =
            new EqualToStringWithUserValuesTest('a', 'a');
        ModelState<EqualToStringWithUserValuesTest> modelState =
            new ModelState<EqualToStringWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        EqualToStringWithDeveloperValuesTest model =
            new EqualToStringWithDeveloperValuesTest('b');
        ModelState<EqualToStringWithDeveloperValuesTest> modelState =
            new ModelState<EqualToStringWithDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to value to compare.', () async {
        EqualToStringTest model = new EqualToStringTest('a', 'a');
        ModelState<EqualToStringTest> modelState =
            new ModelState<EqualToStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is not equal to value to compare.', () async {
        EqualToStringTest model = new EqualToStringTest('a', 'b');
        ModelState<EqualToStringTest> modelState =
            new ModelState<EqualToStringTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, EqualToString);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error,
            'Value is not equal to the value to compare');
      });
    });
  });
}
