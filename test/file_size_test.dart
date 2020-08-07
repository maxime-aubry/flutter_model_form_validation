import 'dart:io';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'file_size_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for FileSize. Valid form.', () {
    File file = new File('${Directory.current.path}\\assets\\glycine.jpg');

    FileSizeTest tester = new FileSizeTest(file);
    bool isValid = ModelState.isValid<FileSizeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for FileSize. Invalid form.', () {
    File file =
        new File('${Directory.current.path}\\assets\\erable-japonais.png');

    FileSizeTest tester = new FileSizeTest(file);
    bool isValid = ModelState.isValid<FileSizeTest>(tester);
    expect(isValid, false);

    expect(ModelState.errors['value'].validatorType, FileMimeType);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid file size');
  });
}

@easyValidator
class FileSizeTest {
  FileSizeTest(this.value);

  @FileMimeType(
    mimeTypes: ['image/jpeg', 'image/bmp'],
    error: 'invalid file size',
  )
  final File value;
}
