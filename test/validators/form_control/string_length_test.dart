import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('StringLength.', () {
    group('Test the validation > success.', () {
      test('String has between 10 and 20 characetrs.', () async {
        StringLengthTest model = new StringLengthTest('Hello everybody');
        ModelFormState modelState = new ModelFormState<StringLengthTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('String has not between 10 and 20 characters.', () async {
        StringLengthTest model = new StringLengthTest('No, I am your father !');
        ModelFormState modelState = new ModelFormState<StringLengthTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, StringLength);
        expect(error.message, 'error message here');
      });
    });
  });
}
