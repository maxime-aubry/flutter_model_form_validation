import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('SmallerOrEqualToNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        SmallerOrEqualToNumberTest model =
            new SmallerOrEqualToNumberTest(10, 10);
        ModelFormState<SmallerOrEqualToNumberTest> modelState =
            new ModelFormState<SmallerOrEqualToNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        SmallerOrEqualToNumberTest model =
            new SmallerOrEqualToNumberTest(10, 10);
        ModelFormState<SmallerOrEqualToNumberTest> modelState =
            new ModelFormState<SmallerOrEqualToNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        SmallerOrEqualToNumberTest model = new SmallerOrEqualToNumberTest(1);
        ModelFormState<SmallerOrEqualToNumberTest> modelState =
            new ModelFormState<SmallerOrEqualToNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is smaller than value to compare.', () async {
        SmallerOrEqualToNumberTest model =
            new SmallerOrEqualToNumberTest(1, 12);
        ModelFormState<SmallerOrEqualToNumberTest> modelState =
            new ModelFormState<SmallerOrEqualToNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('The value is equal to value to compare.', () async {
        SmallerOrEqualToNumberTest model = new SmallerOrEqualToNumberTest(1, 1);
        ModelFormState<SmallerOrEqualToNumberTest> modelState =
            new ModelFormState<SmallerOrEqualToNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is greater than value to compare.', () async {
        SmallerOrEqualToNumberTest model = new SmallerOrEqualToNumberTest(1, 0);
        ModelFormState<SmallerOrEqualToNumberTest> modelState =
            new ModelFormState<SmallerOrEqualToNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, SmallerOrEqualTo);
        expect(error.message, 'error message here');
      });
    });
  });
}