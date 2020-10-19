import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/models.dart';
import 'models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('DateTimeRange.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"Min" and "max" are provided by user and developer. User data has priority.',
          () async {
        DateTimeRangeWithUserAndDeveloperValuesTest model =
            new DateTimeRangeWithUserAndDeveloperValuesTest(
          new DateTime(2020, 8, 15),
          new DateTime(2020, 1, 1),
          new DateTime(2020, 12, 31),
        );
        ModelState<DateTimeRangeWithUserAndDeveloperValuesTest> modelState =
            new ModelState<DateTimeRangeWithUserAndDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"Min" and "max" are provided by user only.', () async {
        DateTimeRangeWithUserValuesTest model =
            new DateTimeRangeWithUserValuesTest(
          new DateTime(2020, 8, 15),
          new DateTime(2020, 1, 1),
          new DateTime(2020, 12, 31),
        );
        ModelState<DateTimeRangeWithUserValuesTest> modelState =
            new ModelState<DateTimeRangeWithUserValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('"Min" and "max" are provided by developer only.', () async {
        DateTimeRangeWithDeveloperValuesTest model =
            new DateTimeRangeWithDeveloperValuesTest(new DateTime(2019, 3, 15));
        ModelState<DateTimeRangeWithDeveloperValuesTest> modelState =
            new ModelState<DateTimeRangeWithDeveloperValuesTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('The value is equal to "min".', () async {
        DateTimeRangeTest model = new DateTimeRangeTest(
          new DateTime(2020, 1, 1),
          new DateTime(2020, 1, 1),
          new DateTime(2020, 12, 31),
        );
        ModelState<DateTimeRangeTest> modelState =
            new ModelState<DateTimeRangeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('The value is between "min" and "max".', () async {
        DateTimeRangeTest model = new DateTimeRangeTest(
          new DateTime(2020, 6, 1),
          new DateTime(2020, 1, 1),
          new DateTime(2020, 12, 31),
        );
        ModelState<DateTimeRangeTest> modelState =
            new ModelState<DateTimeRangeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('The value is equal to "max".', () async {
        DateTimeRangeTest model = new DateTimeRangeTest(
          new DateTime(2020, 12, 31),
          new DateTime(2020, 1, 1),
          new DateTime(2020, 12, 31),
        );
        ModelState<DateTimeRangeTest> modelState =
            new ModelState<DateTimeRangeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is smaller than "min".', () async {
        DateTimeRangeTest model = new DateTimeRangeTest(
          new DateTime(2019, 12, 31),
          new DateTime(2020, 1, 1),
          new DateTime(2020, 12, 31),
        );
        ModelState<DateTimeRangeTest> modelState =
            new ModelState<DateTimeRangeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, DateTimeRange);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error,
            'This datetime is not in the range');
      });

      test('The value is greater than "max".', () async {
        DateTimeRangeTest model = new DateTimeRangeTest(
          new DateTime(2021, 1, 1),
          new DateTime(2020, 1, 1),
          new DateTime(2020, 12, 31),
        );
        ModelState<DateTimeRangeTest> modelState =
            new ModelState<DateTimeRangeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, DateTimeRange);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error,
            'This datetime is not in the range');
      });
    });
  });
}
