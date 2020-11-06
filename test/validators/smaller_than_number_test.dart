import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('SmallerThanNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(10, 11);
        ModelFormState<SmallerThanNumberTest> modelState =
            new ModelFormState<SmallerThanNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(10, 11);
        ModelFormState<SmallerThanNumberTest> modelState =
            new ModelFormState<SmallerThanNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(0);
        ModelFormState<SmallerThanNumberTest> modelState =
            new ModelFormState<SmallerThanNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is smaller than value to compare.', () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(1, 2);
        ModelFormState<SmallerThanNumberTest> modelState =
            new ModelFormState<SmallerThanNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is equal to value to compare.', () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(1, 1);
        ModelFormState<SmallerThanNumberTest> modelState =
            new ModelFormState<SmallerThanNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, SmallerThan);
        expect(error.message, 'error message here');
      });

      test('The value is smaller than value to compare.', () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(1, 0);
        ModelFormState<SmallerThanNumberTest> modelState =
            new ModelFormState<SmallerThanNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, SmallerThan);
        expect(error.message, 'error message here');
      });
    });
  });
}