import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('Required.', () {
    group('Test the validation > success.', () {
      test('Data is provided.', () async {
        RequiredTest model = new RequiredTest('a');
        ModelFormState<RequiredTest> modelState = new ModelFormState<RequiredTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });
    group('Test the validation > failure.', () {
      test('Data is empty string.', () async {
        RequiredTest model = new RequiredTest('');
        ModelFormState<RequiredTest> modelState = new ModelFormState<RequiredTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, Required);
        expect(error.message, 'error message here');
      });

      test('Data is null.', () async {
        RequiredTest model = new RequiredTest(null);
        ModelFormState<RequiredTest> modelState = new ModelFormState<RequiredTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, Required);
        expect(error.message, 'error message here');
      });
    });
  });
}
