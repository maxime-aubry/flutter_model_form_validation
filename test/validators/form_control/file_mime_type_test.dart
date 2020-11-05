import 'dart:io';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('FileMimeType.', () {
    group('Test the validation > success.', () {
      test('Loaded image is JPEG or BNP.', () async {
        File file =
            new File('${Directory.current.path}\\test\\assets\\glycine.jpg');
        FileMimeTypeTest model = new FileMimeTypeTest(file.readAsBytesSync());
        ModelFormState<FileMimeTypeTest> modelState =
            new ModelFormState<FileMimeTypeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });
    });

    group('Test the validation > failure.', () {
      test('Loaded image is neither JPEG or BNP', () async {
        File file = new File(
            '${Directory.current.path}\\test\\assets\\erable-japonais.png');
        FileMimeTypeTest model = new FileMimeTypeTest(file.readAsBytesSync());
        ModelFormState<FileMimeTypeTest> modelState =
            new ModelFormState<FileMimeTypeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error = modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, FileMimeType);
        expect(error.message, 'error message here');
      });
    });
  });
}
