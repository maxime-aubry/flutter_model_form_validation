import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();
  LibraryInitializer.initialize(libraryName: 'test.models');

  group('GreaterOrEqualToString.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"valueToCompare" is provided by user and developer. User data has priority.',
          () async {
        GreaterOrEqualToStringTest model =
            new GreaterOrEqualToStringTest('c', 'c');
        ModelFormState formState = new ModelFormState(model: model);
        formState.initialize();

        expect(await formState.validate(), true);
        expect(formState.status, EFormStatus.valid);

        FormControl<String> fc =
            formState.formBuilder.indexer.ofFormControl<String>('value');
        ValidationError error = formState.getError(fc.uniqueName);
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by user only.', () async {
        GreaterOrEqualToStringTest model =
            new GreaterOrEqualToStringTest('c', 'c');
        ModelFormState formState = new ModelFormState(model: model);

        expect(await formState.validate(), true);
        expect(formState.status, EFormStatus.valid);

        FormControl<String> fc =
            formState.formBuilder.indexer.ofFormControl<String>('value');
        ValidationError error = formState.getError(fc.uniqueName);
        expect(error, isNull);
      });

      test('"valueToCompare" is provided by developer only.', () async {
        GreaterOrEqualToStringTest model = new GreaterOrEqualToStringTest('b');
        ModelFormState formState = new ModelFormState(model: model);

        expect(await formState.validate(), true);
        expect(formState.status, EFormStatus.valid);

        FormControl<String> fc =
            formState.formBuilder.indexer.ofFormControl<String>('value');
        ValidationError error = formState.getError(fc.uniqueName);
        expect(error, isNull);
      });
    });

    group('Test the validation > success.', () {
      test('The value is greater than value to compare.', () async {
        GreaterOrEqualToStringTest model =
            new GreaterOrEqualToStringTest('c', 'b');
        ModelFormState formState = new ModelFormState(model: model);

        expect(await formState.validate(), true);
        expect(formState.status, EFormStatus.valid);

        FormControl<String> fc =
            formState.formBuilder.indexer.ofFormControl<String>('value');
        ValidationError error = formState.getError(fc.uniqueName);
        expect(error, isNull);
      });

      test('The value is equal to value to compare.', () async {
        GreaterOrEqualToStringTest model =
            new GreaterOrEqualToStringTest('b', 'b');
        ModelFormState formState = new ModelFormState(model: model);

        expect(await formState.validate(), true);
        expect(formState.status, EFormStatus.valid);

        FormControl<String> fc =
            formState.formBuilder.indexer.ofFormControl<String>('value');
        ValidationError error = formState.getError(fc.uniqueName);
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('The value is smaller than value to compare.', () async {
        GreaterOrEqualToStringTest model =
            new GreaterOrEqualToStringTest('a', 'b');
        ModelFormState formState = new ModelFormState(model: model);

        expect(await formState.validate(), false);
        expect(formState.status, EFormStatus.invalid);

        FormControl<String> fc =
            formState.formBuilder.indexer.ofFormControl<String>('value');
        ValidationError error = formState.getError(fc.uniqueName);
        expect(error, isNull);
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, GreaterOrEqualTo);
        expect(error.message, 'error message here');
      });
    });
  });
}
