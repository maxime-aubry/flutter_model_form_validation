import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('StringLength.', () {
    group('Test the validation > success.', () {
      test('String has between 10 and 20 characetrs.', () async {
        StringLengthTest model = new StringLengthTest('Hello everybody');
        ModelFormState<StringLengthTest> formState =
            new ModelFormState<StringLengthTest>(model);

        expect(await formState.validateForm(), true);
        expect(formState.status, EFormStatus.valid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('String has not between 10 and 20 characters.', () async {
        StringLengthTest model = new StringLengthTest('No, I am your father !');
        ModelFormState<StringLengthTest> formState =
            new ModelFormState<StringLengthTest>(model);

        expect(await formState.validateForm(), false);
        expect(formState.status, EFormStatus.invalid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, StringLength);
        expect(error.message, 'error message here');
      });
    });
  });
}
