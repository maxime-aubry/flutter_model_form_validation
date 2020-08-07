import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'membership_password_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for MembershipPassword. Valid form.', () {
    MembershipPasswordTest tester = new MembershipPasswordTest('0Siatis@0719');
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

  test('Test for MembershipPassword. Invalid form.', () {
    MembershipPasswordTest tester = new MembershipPasswordTest('0Siatis0719');
    bool isValid = ModelState.isValid<MembershipPasswordTest>(tester);
    Map<String, bool> details = MembershipPassword.getErrorDetails(
        '0Siatis0719', 8, 16, true, true, true, true);
    expect(isValid, false);

    expect(ModelState.errors['a'].validatorType, MembershipPassword);
    expect(ModelState.errors['a'].propertyName, 'a');
    expect(ModelState.errors['a'].error, 'invalid password');

    expect(details['includesAlphabeticalCharacters'], true);
    expect(details['includesUppercaseCharacters'], true);
    expect(details['includesNumericalCharacters'], true);
    expect(details['includesSpecialCharacters'], false);
    expect(details['minLength'], true);
    expect(details['maxLength'], true);
  });
}

@flutterModelFormValidator
class MembershipPasswordTest {
  MembershipPasswordTest(this.a);

  @MembershipPassword(
    minLength: 8,
    maxLength: 16,
    includesAlphabeticalCharacters: true,
    includesUppercaseCharacters: true,
    includesNumericalCharacters: true,
    includesSpecialCharacters: true,
    error: 'invalid password',
  )
  final String a;
}
