import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('StringRange.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"Min" and "max" are provided by user and developer. User data has priority.',
          () async {
        StringRangeTest model = new StringRangeTest('m', 'g', 'o');
        ModelFormState<StringRangeTest> modelState =
            new ModelFormState<StringRangeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"Min" and "max" are provided by user only.', () async {
        StringRangeTest model = new StringRangeTest('m', 'g', 'o');
        ModelFormState<StringRangeTest> modelState =
            new ModelFormState<StringRangeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"Min" and "max" are provided by developer only.', () async {
        StringRangeTest model = new StringRangeTest('c');
        ModelFormState<StringRangeTest> modelState =
            new ModelFormState<StringRangeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to "min".', () async {
        StringRangeTest model = new StringRangeTest('g', 'g', 'o');
        ModelFormState<StringRangeTest> modelState =
            new ModelFormState<StringRangeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('The value is between "min" and "max".', () async {
        StringRangeTest model = new StringRangeTest('m', 'g', 'o');
        ModelFormState<StringRangeTest> modelState =
            new ModelFormState<StringRangeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('The value is equal to "max".', () async {
        StringRangeTest model = new StringRangeTest('o', 'g', 'o');
        ModelFormState<StringRangeTest> modelState =
            new ModelFormState<StringRangeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is smaller than "min".', () async {
        StringRangeTest model = new StringRangeTest('f', 'g', 'o');
        ModelFormState<StringRangeTest> modelState =
            new ModelFormState<StringRangeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, Range);
        expect(error.message, 'error message here');
      });

      test('The value is greater than "max".', () async {
        StringRangeTest model = new StringRangeTest('p', 'g', 'o');
        ModelFormState<StringRangeTest> modelState =
            new ModelFormState<StringRangeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, Range);
        expect(error.message, 'error message here');
      });
    });
  });
}