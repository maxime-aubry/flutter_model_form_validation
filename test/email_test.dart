import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'email_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for Email. Valid form.', () {
    EmailTest tester = new EmailTest('azerty@test.com');
    bool isValid = ModelState.isValid<EmailTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for Email. Invalid form.', () {
    EmailTest tester = new EmailTest('azerty@.com');
    bool isValid = ModelState.isValid<EmailTest>(tester);
    expect(isValid, false);

    expect(ModelState.errors['a'].validatorType, Email);
    expect(ModelState.errors['a'].propertyName, 'a');
    expect(ModelState.errors['a'].error, 'invalid email');
  });
}

@easyValidator
class EmailTest {
  EmailTest(this.a);

  @Email(error: 'invalid email')
  final String a;
}
