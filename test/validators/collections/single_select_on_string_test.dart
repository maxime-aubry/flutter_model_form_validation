import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('SingleSelectString.', () {
    group('Test the priority between user and developer static data.', () {
      test('"Items" is provided by user and developer. User data has priority.',
          () async {
        SingleSelectStringTest model = new SingleSelectStringTest(
          'consectetur',
          [
            'amet',
            'consectetur',
            'adipiscing',
          ],
        );
        ModelFormState<SingleSelectStringTest> modelState =
            new ModelFormState<SingleSelectStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"Items" is provided by user only.', () async {
        SingleSelectStringTest model = new SingleSelectStringTest(
          'consectetur',
          [
            'amet',
            'consectetur',
            'adipiscing',
          ],
        );
        ModelFormState<SingleSelectStringTest> modelState =
            new ModelFormState<SingleSelectStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"Items" is provided by developer only.', () async {
        SingleSelectStringTest model = new SingleSelectStringTest('ipsum');
        ModelFormState<SingleSelectStringTest> modelState =
            new ModelFormState<SingleSelectStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('Select item is into the list.', () async {
        SingleSelectStringTest model = new SingleSelectStringTest('ipsum');
        ModelFormState<SingleSelectStringTest> modelState =
            new ModelFormState<SingleSelectStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('Select item is not into the list.', () async {
        SingleSelectStringTest model = new SingleSelectStringTest('amet');
        ModelFormState<SingleSelectStringTest> modelState =
            new ModelFormState<SingleSelectStringTest>(model);

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
