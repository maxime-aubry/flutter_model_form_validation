import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('xxxx.', () {
    group('Test the validation > success.', () {
      test('Valid password.', () {
        MembershipPasswordTest tester =
            new MembershipPasswordTest('M@xime!20200101');
        bool isValid = ModelState.isValid<MembershipPasswordTest>(tester);
        Map<String, bool> details = MembershipPassword.getErrorDetails(
            '0Siatis@0719', 8, 16, true, true, true, true);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);

        expect(details['includesAlphabeticalCharacters'], true);
        expect(details['includesUppercaseCharacters'], true);
        expect(details['includesNumericalCharacters'], true);
        expect(details['includesSpecialCharacters'], true);
        expect(details['minLength'], true);
        expect(details['maxLength'], true);
      });
    });

    group('Test the validation > failure.', () {
      test('Invalid password.', () {
        MembershipPasswordTest tester =
            new MembershipPasswordTest('Maxime20200101');
        bool isValid = ModelState.isValid<MembershipPasswordTest>(tester);
        Map<String, bool> details = MembershipPassword.getErrorDetails(
            '0Siatis0719', 8, 16, true, true, true, true);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, MembershipPassword);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error, 'Invalid password');

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
