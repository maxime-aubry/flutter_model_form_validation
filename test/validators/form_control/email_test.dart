import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('Email.', () {
    group('Test the validation > success.', () {
      test('Valid email.', () async {
        EmailTest model = new EmailTest('azerty@test.com');
        ModelState<EmailTest> modelState = new ModelState<EmailTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
      });
    });
    group('Test the validation > failure.', () {
      test('Invalid email.', () async {
        EmailTest model = new EmailTest('azerty@.com');
        ModelState<EmailTest> modelState = new ModelState<EmailTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, Email);
        expect(error.message, 'error message here');
      });
    });
  });
}