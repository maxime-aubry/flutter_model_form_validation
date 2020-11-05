import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('ContainsString.', () {
    group('Test the validation > success.', () {
      test('"lorem" is in array.', () async {
        ContainsStringTest model = new ContainsStringTest('lorem');
        ModelFormState<ContainsStringTest> modelState =
            new ModelFormState<ContainsStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('"lorem" is not in array.', () async {
        ContainsStringTest model = new ContainsStringTest('consectetur');
        ModelFormState<ContainsStringTest> modelState =
            new ModelFormState<ContainsStringTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, ContainsString);
        expect(error.message, 'error message here');
      });
    });
  });
}
