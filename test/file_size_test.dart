import 'dart:io';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/models.dart';
import 'models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('FileSize.', () {
    group('Test the validation > success.', () {
      test('Loaded image is lighter or equal to 1MO.', () async {
        File file =
            new File('${Directory.current.path}\\test\\assets\\glycine.jpg');
        FileSizeTest model = new FileSizeTest(file.readAsBytesSync());
        ModelState<FileSizeTest> modelState =
            new ModelState<FileSizeTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('Loaded image is heavier than 1MO.', () async {
        File file = new File(
            '${Directory.current.path}\\test\\assets\\erable-japonais.png');
        FileSizeTest model = new FileSizeTest(file.readAsBytesSync());
        ModelState<FileSizeTest> modelState =
            new ModelState<FileSizeTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, FileSize);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid file size');
      });
    });
  });
}
