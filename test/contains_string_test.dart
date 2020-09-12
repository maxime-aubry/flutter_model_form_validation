import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('ContainsString.', () {
    group('Test the validation > success.', () {
      test('"lorem" is in array.', () {
        ContainsStringTest tester = new ContainsStringTest('lorem');
        bool isValid = ModelState.isValid<ContainsStringTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('"lorem" is not in array.', () {
        ContainsStringTest tester = new ContainsStringTest('consectetur');
        bool isValid = ModelState.isValid<ContainsStringTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, ContainsString);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error, 'Invalid keyword');
      });
    });
  });
}
