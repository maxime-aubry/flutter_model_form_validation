import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('MultiSelectNumber.', () {
    group('Test the priority between user and developer static data.', () {
      test('"Items" is provided by user and developer. User data has priority.',
          () async {
        MultiSelectNumberTest model =
            new MultiSelectNumberTest([4, 5], [4, 5, 6]);
        ModelFormState<MultiSelectNumberTest> modelState =
            new ModelFormState<MultiSelectNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"Items" is provided by user only.', () async {
        MultiSelectNumberTest model =
            new MultiSelectNumberTest([4, 5], [4, 5, 6]);
        ModelFormState<MultiSelectNumberTest> modelState =
            new ModelFormState<MultiSelectNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"Items" is provided by developer only.', () async {
        MultiSelectNumberTest model = new MultiSelectNumberTest([1, 2]);
        ModelFormState<MultiSelectNumberTest> modelState =
            new ModelFormState<MultiSelectNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('Select item is into the list.', () async {
        MultiSelectNumberTest model = new MultiSelectNumberTest([1, 2]);
        ModelFormState<MultiSelectNumberTest> modelState =
            new ModelFormState<MultiSelectNumberTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('Select item is not into the list.', () async {
        MultiSelectNumberTest model = new MultiSelectNumberTest([4, 5]);
        ModelFormState<MultiSelectNumberTest> modelState =
            new ModelFormState<MultiSelectNumberTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, MultiSelect);
        expect(error.message, 'error message here');
      });
    });
  });
}
