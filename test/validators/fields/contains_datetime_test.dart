import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('ContainsDateTime.', () {
    group('Test the validation > success.', () {
      test('"2020-06-01" is in array.', () async {
        ContainsDateTimeTest model = new ContainsDateTimeTest(
          new DateTime(2020, 6, 1),
        );
        ModelFormState<ContainsDateTimeTest> modelState =
            new ModelFormState<ContainsDateTimeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('"2020-06-02" is not in array.', () async {
        ContainsDateTimeTest model = new ContainsDateTimeTest(
          new DateTime(2020, 6, 2),
        );
        ModelFormState<ContainsDateTimeTest> modelState =
            new ModelFormState<ContainsDateTimeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, Contains);
        expect(error.message, 'error message here');
      });
    });
  });
}
