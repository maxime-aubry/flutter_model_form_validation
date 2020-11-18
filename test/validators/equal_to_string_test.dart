import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('EqualToString.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        EqualToStringTest model = new EqualToStringTest('a', 'a');
        ModelFormState<EqualToStringTest> modelState =
            new ModelFormState<EqualToStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        EqualToStringTest model = new EqualToStringTest('a', 'a');
        ModelFormState<EqualToStringTest> modelState =
            new ModelFormState<EqualToStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        EqualToStringTest model = new EqualToStringTest('b');
        ModelFormState<EqualToStringTest> modelState =
            new ModelFormState<EqualToStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to value to compare.', () async {
        EqualToStringTest model = new EqualToStringTest('a', 'a');
        ModelFormState<EqualToStringTest> modelState =
            new ModelFormState<EqualToStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is not equal to value to compare.', () async {
        EqualToStringTest model = new EqualToStringTest('a', 'b');
        ModelFormState<EqualToStringTest> modelState =
            new ModelFormState<EqualToStringTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, EqualTo);
        expect(error.message, 'error message here');
      });
    });
  });
}
