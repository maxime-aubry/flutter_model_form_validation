import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('NumberRange.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"Min" and "max" are provided by user and developer. User data has priority.',
          () async {
        NumberRangeTest model = new NumberRangeTest(5, 1, 10);
        ModelFormState<NumberRangeTest> modelState =
            new ModelFormState<NumberRangeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });

      test('"Min" and "max" are provided by user only.', () async {
        NumberRangeTest model = new NumberRangeTest(5, 1, 10);
        ModelFormState<NumberRangeTest> modelState =
            new ModelFormState<NumberRangeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });

      test('"Min" and "max" are provided by developer only.', () async {
        NumberRangeTest model = new NumberRangeTest(-5);
        ModelFormState<NumberRangeTest> modelState =
            new ModelFormState<NumberRangeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to "min".', () async {
        NumberRangeTest model = new NumberRangeTest(1, 1, 10);
        ModelFormState<NumberRangeTest> modelState =
            new ModelFormState<NumberRangeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });

      test('The value is between "min" and "max".', () async {
        NumberRangeTest model = new NumberRangeTest(5, 1, 10);
        ModelFormState<NumberRangeTest> modelState =
            new ModelFormState<NumberRangeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });

      test('The value is equal to "max".', () async {
        NumberRangeTest model = new NumberRangeTest(10, 1, 10);
        ModelFormState<NumberRangeTest> modelState =
            new ModelFormState<NumberRangeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is smaller than "min".', () async {
        NumberRangeTest model = new NumberRangeTest(0, 1, 10);
        ModelFormState<NumberRangeTest> modelState =
            new ModelFormState<NumberRangeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, Range);
        expect(error.message, 'error message here');
      });

      test('The value is greater than "max".', () async {
        NumberRangeTest model = new NumberRangeTest(11, 1, 10);
        ModelFormState<NumberRangeTest> modelState =
            new ModelFormState<NumberRangeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, Range);
        expect(error.message, 'error message here');
      });
    });
  });
}
