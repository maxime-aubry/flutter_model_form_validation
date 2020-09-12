import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('Required.', () {
    group('Test the validation > success.', () {
      test('Data is provided.', () {
        RequiredTest tester = new RequiredTest('a');
        bool isValid = ModelState.isValid<RequiredTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });
    group('Test the validation > failure.', () {
      test('Data is empty string.', () {
        RequiredTest tester = new RequiredTest('');
        bool isValid = ModelState.isValid<RequiredTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, Required);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error, 'Value is required');
      });

      test('Data is null.', () {
        RequiredTest tester = new RequiredTest(null);
        bool isValid = ModelState.isValid<RequiredTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, Required);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error, 'Value is required');
      });
    });
  });
}
