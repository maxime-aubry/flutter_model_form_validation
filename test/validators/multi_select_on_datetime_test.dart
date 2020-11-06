import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('MultiSelectDateTime.', () {
    group('Test the priority between user and developer static data.', () {
      test('"Items" is provided by user and developer. User data has priority.',
          () async {
        MultiSelectDatetimeTest model = new MultiSelectDatetimeTest(
          [
            new DateTime(2020, 02, 01),
            new DateTime(2020, 02, 02),
          ],
          [
            new DateTime(2020, 02, 01),
            new DateTime(2020, 02, 02),
            new DateTime(2020, 02, 02),
          ],
        );
        ModelFormState<MultiSelectDatetimeTest> modelState =
            new ModelFormState<MultiSelectDatetimeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"Items" is provided by user only.', () async {
        MultiSelectDatetimeTest model = new MultiSelectDatetimeTest(
          [
            new DateTime(2020, 02, 01),
            new DateTime(2020, 02, 02),
          ],
          [
            new DateTime(2020, 02, 01),
            new DateTime(2020, 02, 02),
            new DateTime(2020, 02, 02),
          ],
        );
        ModelFormState<MultiSelectDatetimeTest> modelState =
            new ModelFormState<MultiSelectDatetimeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"Items" is provided by developer only.', () async {
        MultiSelectDatetimeTest model = new MultiSelectDatetimeTest(
          [
            new DateTime(2020, 01, 01),
            new DateTime(2020, 01, 02),
          ],
        );
        ModelFormState<MultiSelectDatetimeTest> modelState =
            new ModelFormState<MultiSelectDatetimeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('Select item is into the list.', () async {
        MultiSelectDatetimeTest model = new MultiSelectDatetimeTest(
          [
            new DateTime(2020, 01, 01),
            new DateTime(2020, 01, 02),
          ],
        );
        ModelFormState<MultiSelectDatetimeTest> modelState =
            new ModelFormState<MultiSelectDatetimeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('Select item is not into the list.', () async {
        MultiSelectDatetimeTest model = new MultiSelectDatetimeTest(
          [
            new DateTime(2020, 01, 04),
            new DateTime(2020, 01, 05),
          ],
        );
        ModelFormState<MultiSelectDatetimeTest> modelState =
            new ModelFormState<MultiSelectDatetimeTest>(model);

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
