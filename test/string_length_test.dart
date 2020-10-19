import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('StringLength.', () {
    group('Test the validation > success.', () {
      test('String has between 10 and 20 characetrs.', () async {
        StringLengthTest model = new StringLengthTest('Hello everybody');
        ModelState modelState = new ModelState<StringLengthTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('String has not between 10 and 20 characters.', () async {
        StringLengthTest model = new StringLengthTest('No, I am your father !');
        ModelState modelState = new ModelState<StringLengthTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, StringLength);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error,
            '"value" property must have between 10 and 20 characters');
      });
    });
  });
}
