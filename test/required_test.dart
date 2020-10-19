import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/models.dart';
import 'models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('Required.', () {
    group('Test the validation > success.', () {
      test('Data is provided.', () async {
        RequiredTest model = new RequiredTest('a');
        ModelState modelState = new ModelState<RequiredTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });
    group('Test the validation > failure.', () {
      test('Data is empty string.', () async {
        RequiredTest model = new RequiredTest('');
        ModelState modelState = new ModelState<RequiredTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, Required);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Value is required');
      });

      test('Data is null.', () async {
        RequiredTest model = new RequiredTest(null);
        ModelState modelState = new ModelState<RequiredTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, Required);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Value is required');
      });
    });
  });
}
