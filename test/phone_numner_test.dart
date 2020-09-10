import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('PhoneNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"countryCode" is provided by user and developer. User data has priority.',
          () {
        PhoneNumberWithUserAndDeveloperValuesTest tester =
            new PhoneNumberWithUserAndDeveloperValuesTest(
                '01.82.86.66.93', 'FR');
        bool isValid =
            ModelState.isValid<PhoneNumberWithUserAndDeveloperValuesTest>(
                tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"countryCode" is provided by user only.', () {
        PhoneNumberWithUserValuesTest tester =
            new PhoneNumberWithUserValuesTest('01.82.86.66.93', 'FR');
        bool isValid =
            ModelState.isValid<PhoneNumberWithUserValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"countryCode" is provided by developer only.', () {
        PhoneNumberWithDeveloperValuesTest tester =
            new PhoneNumberWithDeveloperValuesTest('713-705-9618');
        bool isValid =
            ModelState.isValid<PhoneNumberWithDeveloperValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('Valid phone number AE, 971(6)5366187.', () {
        PhoneNumberTest tester = new PhoneNumberTest('971(6)5366187', 'AE');
        bool isValid = ModelState.isValid(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('Valid phone number AE, +971-(5)5-366-187.', () {
        PhoneNumberTest tester = new PhoneNumberTest('971(6)5366187', 'AE');
        bool isValid = ModelState.isValid(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      // test('Invalid phone number (xx).', () {
      //   PhoneNumberTest tester = new PhoneNumberTest('', '');
      //   bool isValid = ModelState.isValid<PhoneNumberTest>(tester);
      //   expect(isValid, false);

      //   expect(ModelState.errors['value'].validatorType, PhoneNumber);
      //   expect(ModelState.errors['value'].propertyName, 'value');
      //   expect(ModelState.errors['value'].error, 'Invalid phone number');
      // });
    });
  });
}
