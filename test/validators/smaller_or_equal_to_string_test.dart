import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('SmallerOrEqualToString.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        SmallerOrEqualToStringTest model =
            new SmallerOrEqualToStringTest('c', 'c');
        ModelFormState<SmallerOrEqualToStringTest> modelState =
            new ModelFormState<SmallerOrEqualToStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        SmallerOrEqualToStringTest model =
            new SmallerOrEqualToStringTest('c', 'c');
        ModelFormState<SmallerOrEqualToStringTest> modelState =
            new ModelFormState<SmallerOrEqualToStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        SmallerOrEqualToStringTest model = new SmallerOrEqualToStringTest('b');
        ModelFormState<SmallerOrEqualToStringTest> modelState =
            new ModelFormState<SmallerOrEqualToStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is smaller than value to compare.', () async {
        SmallerOrEqualToStringTest model =
            new SmallerOrEqualToStringTest('b', 'c');
        ModelFormState<SmallerOrEqualToStringTest> modelState =
            new ModelFormState<SmallerOrEqualToStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });

      test('The value is equal to value to compare.', () async {
        SmallerOrEqualToStringTest model =
            new SmallerOrEqualToStringTest('b', 'b');
        ModelFormState<SmallerOrEqualToStringTest> modelState =
            new ModelFormState<SmallerOrEqualToStringTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is greater than value to compare.', () async {
        SmallerOrEqualToStringTest model =
            new SmallerOrEqualToStringTest('b', 'a');
        ModelFormState<SmallerOrEqualToStringTest> modelState =
            new ModelFormState<SmallerOrEqualToStringTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getPropertyFullname('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, SmallerOrEqualTo);
        expect(error.message, 'error message here');
      });
    });
  });
}
