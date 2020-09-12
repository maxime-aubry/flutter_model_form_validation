import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('StringLength.', () {
    group('Test the validation > success.', () {
      test('String has between 10 and 20 characetrs.', () {
        StringLengthTest tester = new StringLengthTest('Hello everybody');
        bool isValid = ModelState.isValid<StringLengthTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('String has not between 10 and 20 characters.', () {
        StringLengthTest tester =
            new StringLengthTest('No, I am your father !');
        bool isValid = ModelState.isValid<StringLengthTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, StringLength);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error,
            '"value" property must have between 10 and 20 characters');
      });
    });
  });
}
