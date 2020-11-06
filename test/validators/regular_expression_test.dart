import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('RegularExpression.', () {
    group('Test the validation > success.', () {
      test('Valid regular expression.', () async {
        RegularExpressionTest model = new RegularExpressionTest('Hello');
        ModelFormState<RegularExpressionTest> modelState =
            new ModelFormState<RegularExpressionTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('Invalid regular expression.', () async {
        RegularExpressionTest model = new RegularExpressionTest('Good morning');
        ModelFormState<RegularExpressionTest> modelState =
            new ModelFormState<RegularExpressionTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, RegularExpression);
        expect(error.message, 'error message here');
      });
    });
  });
}
