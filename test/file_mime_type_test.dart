import 'dart:io';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'file_mime_type_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for FileMimeType. Valid form.', () {
    File file = new File('${Directory.current.path}\\assets\\glycine.jpg');

    FileMimeTypeTest tester = new FileMimeTypeTest(file);
    bool isValid = ModelState.isValid<FileMimeTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for FileMimeType. Invalid form.', () {
    File file =
        new File('${Directory.current.path}\\assets\\erable-japonais.png');

    FileMimeTypeTest tester = new FileMimeTypeTest(file);
    bool isValid = ModelState.isValid<FileMimeTypeTest>(tester);
    expect(isValid, false);

    expect(ModelState.errors['value'].validatorType, FileMimeType);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid mime type');
  });
}

@flutterModelFormValidator
class FileMimeTypeTest {
  FileMimeTypeTest(this.value);

  @FileMimeType(
    mimeTypes: ['image/jpeg', 'image/bmp'],
    error: 'invalid mime type',
  )
  final File value;
}
