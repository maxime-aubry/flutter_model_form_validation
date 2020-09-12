import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('ContainsDateTime.', () {
    group('Test the validation > success.', () {
      test('"2020-06-01" is in array.', () {
        ContainsDateTimeTest tester =
            new ContainsDateTimeTest(new DateTime(2020, 6, 1));
        bool isValid = ModelState.isValid<ContainsDateTimeTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('"2020-06-02" is not in array.', () {
        ContainsDateTimeTest tester =
            new ContainsDateTimeTest(new DateTime(2020, 6, 2));
        bool isValid = ModelState.isValid<ContainsDateTimeTest>(tester);
        expect(isValid, false);

        expect(ModelState.errors['value'].validatorType, ContainsDateTime);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error, 'Invalid datetime');
      });
    });
  });
}
