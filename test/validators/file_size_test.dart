import 'dart:io';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('FileSize.', () {
    group('Test the validation > success.', () {
      test('Loaded image is lighter or equal to 1MO.', () async {
        File file = new File('${Directory.current.path}/assets/glycine.jpg');
        FileSizeTest model = new FileSizeTest(file.readAsBytesSync());
        ModelFormState formState = new ModelFormState(model);

        expect(await formState.validateForm(), true);
        expect(formState.status, EFormStatus.valid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('Loaded image is heavier than 1MO.', () async {
        File file =
            new File('${Directory.current.path}/assets/erable-japonais.png');
        FileSizeTest model = new FileSizeTest(file.readAsBytesSync());
        ModelFormState formState = new ModelFormState(model);

        expect(await formState.validateForm(), false);
        expect(formState.status, EFormStatus.invalid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, FileSize);
        expect(error.message, 'error message here');
      });
    });
  });
}
