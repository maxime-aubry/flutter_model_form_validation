import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('ContainsNumber.', () {
    group('Test the validation > success.', () {
      test('2 is in array.', () {
        ContainsNumberTest tester = new ContainsNumberTest(2);
        bool isValid = ModelState.isValid<ContainsNumberTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('4 is not in array.', () {
        ContainsNumberTest tester = new ContainsNumberTest(4);
        bool isValid = ModelState.isValid<ContainsNumberTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, ContainsNumber);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error, 'Invalid number');
      });
    });
  });
}
