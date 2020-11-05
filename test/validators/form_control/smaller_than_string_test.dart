import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('SmallerThanString.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        SmallerThanStringWithUserAndDeveloperValuesTest model =
            new SmallerThanStringWithUserAndDeveloperValuesTest('c', 'd');
        ModelFormState modelState =
            new ModelFormState<SmallerThanStringWithUserAndDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        SmallerThanStringWithUserValuesTest model =
            new SmallerThanStringWithUserValuesTest('c', 'd');
        ModelFormState modelState =
            new ModelFormState<SmallerThanStringWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        SmallerThanStringWithDeveloperValuesTest model =
            new SmallerThanStringWithDeveloperValuesTest('a');
        ModelFormState modelState =
            new ModelFormState<SmallerThanStringWithDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is smaller than value to compare.', () async {
        SmallerThanStringTest model = new SmallerThanStringTest('b', 'c');
        ModelFormState modelState =
            new ModelFormState<SmallerThanStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is equal to value to compare.', () async {
        SmallerThanStringTest model = new SmallerThanStringTest('b', 'b');
        ModelFormState modelState =
            new ModelFormState<SmallerThanStringTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, SmallerThanString);
        expect(error.message, 'error message here');
      });

      test('The value is not equal to value to compare.', () async {
        SmallerThanStringTest model = new SmallerThanStringTest('b', 'a');
        ModelFormState modelState =
            new ModelFormState<SmallerThanStringTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, SmallerThanString);
        expect(error.message, 'error message here');
      });
    });
  });
}
