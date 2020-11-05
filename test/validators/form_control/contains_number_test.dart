import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('ContainsNumber.', () {
    group('Test the validation > success.', () {
      test('2 is in array.', () async {
        ContainsNumberTest model = new ContainsNumberTest(2);
        ModelFormState<ContainsNumberTest> modelState =
            new ModelFormState<ContainsNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('4 is not in array.', () async {
        ContainsNumberTest model = new ContainsNumberTest(4);
        ModelFormState<ContainsNumberTest> modelState =
            new ModelFormState<ContainsNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, ContainsNumber);
        expect(error.message, 'error message here');
      });
    });
  });
}
