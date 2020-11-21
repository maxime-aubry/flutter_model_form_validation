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
        ModelFormState<SmallerThanNumberTest> formState =
            new ModelFormState<SmallerThanNumberTest>(model);

        expect(await formState.validateForm(), true);
        expect(formState.status, EFormStatus.valid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(10, 11);
        ModelFormState<SmallerThanNumberTest> formState =
            new ModelFormState<SmallerThanNumberTest>(model);

        expect(await formState.validateForm(), true);
        expect(formState.status, EFormStatus.valid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(0);
        ModelFormState<SmallerThanNumberTest> formState =
            new ModelFormState<SmallerThanNumberTest>(model);

        expect(await formState.validateForm(), true);
        expect(formState.status, EFormStatus.valid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is smaller than value to compare.', () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(1, 2);
        ModelFormState<SmallerThanNumberTest> formState =
            new ModelFormState<SmallerThanNumberTest>(model);

        expect(await formState.validateForm(), true);
        expect(formState.status, EFormStatus.valid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is equal to value to compare.', () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(1, 1);
        ModelFormState<SmallerThanNumberTest> formState =
            new ModelFormState<SmallerThanNumberTest>(model);

        expect(await formState.validateForm(), false);
        expect(formState.status, EFormStatus.invalid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, SmallerThan);
        expect(error.message, 'error message here');
      });

      test('The value is smaller than value to compare.', () async {
        SmallerThanNumberTest model = new SmallerThanNumberTest(1, 0);
        ModelFormState<SmallerThanNumberTest> formState =
            new ModelFormState<SmallerThanNumberTest>(model);

        expect(await formState.validateForm(), false);
        expect(formState.status, EFormStatus.invalid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, SmallerThan);
        expect(error.message, 'error message here');
      });
    });
  });
}
