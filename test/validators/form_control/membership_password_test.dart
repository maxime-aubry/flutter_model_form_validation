import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('MembershipPassword.', () {
    group('Test the validation > success.', () {
      test('Valid password.', () async {
        MembershipPasswordTest model =
            new MembershipPasswordTest('M@xime!20200101');
        ModelFormState modelState =
            new ModelFormState<MembershipPasswordTest>(model);
        Map<String, bool> details = MembershipPassword.getErrorDetails(
            '0Siatis@0719', 8, 16, true, true, true, true);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNull);
        expect(details['includesAlphabeticalCharacters'], true);
        expect(details['includesUppercaseCharacters'], true);
        expect(details['includesNumericalCharacters'], true);
        expect(details['includesSpecialCharacters'], true);
        expect(details['minLength'], true);
        expect(details['maxLength'], true);
      });
    });

    group('Test the validation > failure.', () {
      test('Invalid password.', () async {
        MembershipPasswordTest model =
            new MembershipPasswordTest('Maxime20200101');
        ModelFormState modelState =
            new ModelFormState<MembershipPasswordTest>(model);
        Map<String, bool> details = MembershipPassword.getErrorDetails(
            '0Siatis0719', 8, 16, true, true, true, true);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getValidationError(model, 'value');
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, MembershipPassword);
        expect(error.message, 'error message here');
        expect(details['includesAlphabeticalCharacters'], true);
        expect(details['includesUppercaseCharacters'], true);
        expect(details['includesNumericalCharacters'], true);
        expect(details['includesSpecialCharacters'], false);
        expect(details['minLength'], true);
        expect(details['maxLength'], true);
      });
    });
  });
}
