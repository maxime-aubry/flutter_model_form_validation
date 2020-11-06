import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('GreaterThanNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        GreaterThanNumberTest model = new GreaterThanNumberTest(11, 10);
        ModelFormState<GreaterThanNumberTest> modelState =
            new ModelFormState<GreaterThanNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        GreaterThanNumberTest model = new GreaterThanNumberTest(11, 10);
        ModelFormState<GreaterThanNumberTest> modelState =
            new ModelFormState<GreaterThanNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        GreaterThanNumberTest model = new GreaterThanNumberTest(2);
        ModelFormState<GreaterThanNumberTest> modelState =
            new ModelFormState<GreaterThanNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is greater than value to compare.', () async {
        GreaterThanNumberTest model = new GreaterThanNumberTest(2, 1);
        ModelFormState<GreaterThanNumberTest> modelState =
            new ModelFormState<GreaterThanNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is equal to value to compare.', () async {
        GreaterThanNumberTest model = new GreaterThanNumberTest(1, 1);
        ModelFormState<GreaterThanNumberTest> modelState =
            new ModelFormState<GreaterThanNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, GreaterThan);
        expect(error.message, 'error message here');
      });

      test('The value is smaller than value to compare.', () async {
        GreaterThanNumberTest model = new GreaterThanNumberTest(0, 1);
        ModelFormState<GreaterThanNumberTest> modelState =
            new ModelFormState<GreaterThanNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, GreaterThan);
        expect(error.message, 'error message here');
      });
    });
  });
}