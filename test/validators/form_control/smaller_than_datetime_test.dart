import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('SmallerThanDatetime.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        SmallerThanDatetimeWithUserAndDeveloperValuesTest model =
            new SmallerThanDatetimeWithUserAndDeveloperValuesTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 2),
        );
        ModelFormState modelState = new ModelFormState<
            SmallerThanDatetimeWithUserAndDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        SmallerThanDatetimeWithUserValuesTest model =
            new SmallerThanDatetimeWithUserValuesTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 2),
        );
        ModelFormState modelState =
            new ModelFormState<SmallerThanDatetimeWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        SmallerThanDatetimeWithDeveloperValuesTest model =
            new SmallerThanDatetimeWithDeveloperValuesTest(
          new DateTime(2018, 12, 31),
        );
        ModelFormState modelState =
            new ModelFormState<SmallerThanDatetimeWithDeveloperValuesTest>(
                model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is smaller than value to compare.', () async {
        SmallerThanDatetimeTest model = new SmallerThanDatetimeTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 2),
        );
        ModelFormState modelState =
            new ModelFormState<SmallerThanDatetimeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is equal to value to compare.', () async {
        SmallerThanDatetimeTest model = new SmallerThanDatetimeTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
        );
        ModelFormState modelState =
            new ModelFormState<SmallerThanDatetimeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, SmallerThanDateTime);
        expect(error.message, 'error message here');
      });

      test('The value is smaller than value to compare.', () async {
        SmallerThanDatetimeTest model = new SmallerThanDatetimeTest(
          new DateTime(2020, 1, 1),
          new DateTime(2019, 12, 31),
        );
        ModelFormState modelState =
            new ModelFormState<SmallerThanDatetimeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, SmallerThanDateTime);
        expect(error.message, 'error message here');
      });
    });
  });
}
