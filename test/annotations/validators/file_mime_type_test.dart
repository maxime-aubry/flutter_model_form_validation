import 'dart:io';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('FileMimeType.', () {
    group('Test the validation > success.', () {
      test('Loaded image is JPEG or BNP.', () async {
        File file = new File('${Directory.current.path}/assets/glycine.jpg');
        FileMimeTypeTest model = new FileMimeTypeTest(file.readAsBytesSync());
        ModelFormState formState = new ModelFormState(model: model);

        expect(await formState.validate(), true);
        expect(formState.status, EFormStatus.valid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('Loaded image is neither JPEG or BNP', () async {
        File file =
            new File('${Directory.current.path}/assets/erable-japonais.png');
        FileMimeTypeTest model = new FileMimeTypeTest(file.readAsBytesSync());
        ModelFormState formState = new ModelFormState(model: model);

        expect(await formState.validate(), false);
        expect(formState.status, EFormStatus.invalid);
        ValidationError error = formState.formBuilder
            .getFormElement<ModelFormControl>(model, 'value')
            ?.error;
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, FileMimeType);
        expect(error.message, 'error message here');
      });
    });
  });
}
