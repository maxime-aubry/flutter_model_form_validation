import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'phone_number_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for PhoneNumber. Country code is provided by developer and user. Valid form.', () {
    PhoneNumberWithBothTypesTest tester =
        new PhoneNumberWithBothTypesTest('04.13.91.97.22', 'FR');
    bool isValid = ModelState.isValid<PhoneNumberWithBothTypesTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for PhoneNumber. Country code is provided by developer and user. Invalid form.', () {
    PhoneNumberWithBothTypesTest tester =
        new PhoneNumberWithBothTypesTest('00.13.91.97.22', 'FR');
    bool isValid = ModelState.isValid<PhoneNumberWithBothTypesTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, PhoneNumber);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid phone number');
  });

  test('Test for PhoneNumber. Country code is provided by developer. Valid form.', () {
    PhoneNumberWithDeveloperTypeTest tester =
        new PhoneNumberWithDeveloperTypeTest('703-908-8065');
    bool isValid = ModelState.isValid<PhoneNumberWithDeveloperTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for PhoneNumber. Country code is provided by developer. Invalid form.', () {
    PhoneNumberWithDeveloperTypeTest tester =
        new PhoneNumberWithDeveloperTypeTest('+003-908-8065');
    bool isValid = ModelState.isValid<PhoneNumberWithDeveloperTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, PhoneNumber);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid phone number');
  });

  test('Test for PhoneNumber. Country code is provided by user (AE). Valid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('+97142251328', 'AE');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for PhoneNumber. Country code is provided by user (AE). Invalid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('+07142251328', 'AE');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, PhoneNumber);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid phone number');
  });

  test('Test for PhoneNumber. Country code is provided by user (BR). Valid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('(51)53213479', 'BR');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for PhoneNumber. Country code is provided by user (BR). Invalid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('(51)5321347', 'BR');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, PhoneNumber);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid phone number');
  });

  test('Test for PhoneNumber. Country code is provided by user (CN). Valid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('13063766888', 'CN');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for PhoneNumber. Country code is provided by user (CN). Invalid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('1306376688', 'CN');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, PhoneNumber);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid phone number');
  });

  test('Test for PhoneNumber. Country code is provided by user (CZ). Valid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('604658150', 'CZ');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for PhoneNumber. Country code is provided by user (CZ). Invalid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('60465815', 'CZ');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, PhoneNumber);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid phone number');
  });

  test('Test for PhoneNumber. Country code is provided by user (DE). Valid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('06556944508', 'DE');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for PhoneNumber. Country code is provided by user (DE). Invalid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('+06556944508', 'DE');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, PhoneNumber);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid phone number');
  });

  test('Test for PhoneNumber. Country code is provided by user (DK). Valid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('28581697', 'DK');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for PhoneNumber. Country code is provided by user (DK). Invalid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('+28581697', 'DK');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, PhoneNumber);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid phone number');
  });

  test('Test for PhoneNumber. Country code is provided by user (ES). Valid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('740725171', 'ES');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for PhoneNumber. Country code is provided by user (ES). Invalid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('+740725171', 'ES');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, PhoneNumber);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid phone number');
  });

  test('Test for PhoneNumber. Country code is provided by user (FR). Valid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('04.13.91.97.22', 'FR');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for PhoneNumber. Country code is provided by user (FR). Invalid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('00.13.91.97.22', 'FR');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, PhoneNumber);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid phone number');
  });

  test('Test for PhoneNumber. Country code is provided by user (GB). Valid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('07010388254', 'GB');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for PhoneNumber. Country code is provided by user (GB). Invalid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('+07010388254', 'GB');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, PhoneNumber);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid phone number');
  });

  test('Test for PhoneNumber. Country code is provided by user (IN). Valid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('02226526345', 'IN');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for PhoneNumber. Country code is provided by user (IN). Invalid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('+022265263', 'IN');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, PhoneNumber);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid phone number');
  });

  test('Test for PhoneNumber. Country code is provided by user (MA). Valid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('0522905498', 'MA');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for PhoneNumber. Country code is provided by user (MA). Invalid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('+0522905498', 'MA');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, PhoneNumber);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid phone number');
  });

  test('Test for PhoneNumber. Country code is provided by user (NL). Valid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('0641242323', 'NL');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for PhoneNumber. Country code is provided by user (NL). Invalid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('+064124233', 'NL');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, PhoneNumber);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid phone number');
  });

  test('Test for PhoneNumber. Country code is provided by user (RO). Valid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('0241236557', 'RO');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for PhoneNumber. Country code is provided by user (RO). Invalid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('+024123655', 'RO');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, PhoneNumber);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid phone number');
  });

  test('Test for PhoneNumber. Country code is provided by user (US). Valid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('703-908-8065', 'US');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for PhoneNumber. Country code is provided by user (US). Invalid form.', () {
    PhoneNumberWithUserTypeTest tester =
        new PhoneNumberWithUserTypeTest('+003-908-8065', 'US');
    bool isValid = ModelState.isValid<PhoneNumberWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, PhoneNumber);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid phone number');
  });
}

@easyValidator
class PhoneNumberWithBothTypesTest {
  PhoneNumberWithBothTypesTest(this.value, this.countryCode);

  @PhoneNumber(
      countryCodeOnProperty: 'countryCode',
      countryCode: 'US',
      error: 'invalid phone number')
  final String value;

  final String countryCode;
}

@easyValidator
class PhoneNumberWithDeveloperTypeTest {
  PhoneNumberWithDeveloperTypeTest(this.value);

  @PhoneNumber(countryCode: 'US', error: 'invalid phone number')
  final String value;
}

@easyValidator
class PhoneNumberWithUserTypeTest {
  PhoneNumberWithUserTypeTest(this.value, this.countryCode);

  @PhoneNumber(countryCodeOnProperty: 'countryCode', error: 'invalid phone number')
  final String value;

  final String countryCode;
}
