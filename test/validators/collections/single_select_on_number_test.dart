import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('SingleSelectNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test('"Items" is provided by user and developer. User data has priority.',
          () async {
        SingleSelectNumberTest model = new SingleSelectNumberTest(4, [4, 5, 6]);
        ModelFormState<SingleSelectNumberTest> modelState =
            new ModelFormState<SingleSelectNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"Items" is provided by user only.', () async {
        SingleSelectNumberTest model = new SingleSelectNumberTest(4, [4, 5, 6]);
        ModelFormState<SingleSelectNumberTest> modelState =
            new ModelFormState<SingleSelectNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"Items" is provided by developer only.', () async {
        SingleSelectNumberTest model = new SingleSelectNumberTest(2);
        ModelFormState<SingleSelectNumberTest> modelState =
            new ModelFormState<SingleSelectNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('Select item is into the list.', () async {
        SingleSelectNumberTest model = new SingleSelectNumberTest(2);
        ModelFormState<SingleSelectNumberTest> modelState =
            new ModelFormState<SingleSelectNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('Select item is not into the list.', () async {
        SingleSelectNumberTest model = new SingleSelectNumberTest(4);
        ModelFormState<SingleSelectNumberTest> modelState =
            new ModelFormState<SingleSelectNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, SingleSelect);
        expect(error.message, 'error message here');
      });
    });
  });
}
