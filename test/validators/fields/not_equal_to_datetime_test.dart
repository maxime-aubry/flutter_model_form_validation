import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('NotEqualToDatetime.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        NotEqualToDatetimeTest model = new NotEqualToDatetimeTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        ModelFormState<NotEqualToDatetimeTest> modelState =
            new ModelFormState<NotEqualToDatetimeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        NotEqualToDatetimeTest model = new NotEqualToDatetimeTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        ModelFormState<NotEqualToDatetimeTest> modelState =
            new ModelFormState<NotEqualToDatetimeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        NotEqualToDatetimeTest model = new NotEqualToDatetimeTest(
          new DateTime(2019, 1, 2),
        );
        ModelFormState<NotEqualToDatetimeTest> modelState =
            new ModelFormState<NotEqualToDatetimeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to value to compare.', () async {
        NotEqualToDatetimeTest model = new NotEqualToDatetimeTest(
          new DateTime(2020, 1, 2),
          new DateTime(2020, 1, 1),
        );
        ModelFormState<NotEqualToDatetimeTest> modelState =
            new ModelFormState<NotEqualToDatetimeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is not equal to value to compare.', () async {
        NotEqualToDatetimeTest model = new NotEqualToDatetimeTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        ModelFormState<NotEqualToDatetimeTest> modelState =
            new ModelFormState<NotEqualToDatetimeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, NotEqualTo);
        expect(error.message, 'error message here');
      });
    });
  });
}
