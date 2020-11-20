import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('EqualToDatetime.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        EqualToDatetimeTest model = new EqualToDatetimeTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        ModelFormState<EqualToDatetimeTest> formState =
            new ModelFormState<EqualToDatetimeTest>(model);

        expect(await formState.validateForm(), true);
        expect(formState.status, EFormStatus.valid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        EqualToDatetimeTest model = new EqualToDatetimeTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        ModelFormState<EqualToDatetimeTest> formState =
            new ModelFormState<EqualToDatetimeTest>(model);

        expect(await formState.validateForm(), true);
        expect(formState.status, EFormStatus.valid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        EqualToDatetimeTest model = new EqualToDatetimeTest(
          new DateTime(2019, 1, 1),
        );
        ModelFormState<EqualToDatetimeTest> formState =
            new ModelFormState<EqualToDatetimeTest>(model);

        expect(await formState.validateForm(), true);
        expect(formState.status, EFormStatus.valid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to value to compare.', () async {
        EqualToDatetimeTest model = new EqualToDatetimeTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        ModelFormState<EqualToDatetimeTest> formState =
            new ModelFormState<EqualToDatetimeTest>(model);

        expect(await formState.validateForm(), true);
        expect(formState.status, EFormStatus.valid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is not equal to value to compare.', () async {
        EqualToDatetimeTest model = new EqualToDatetimeTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        ModelFormState<EqualToDatetimeTest> formState =
            new ModelFormState<EqualToDatetimeTest>(model);

        expect(await formState.validateForm(), false);
        expect(formState.status, EFormStatus.invalid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, EqualTo);
        expect(error.message, 'error message here');
      });
    });
  });
}
