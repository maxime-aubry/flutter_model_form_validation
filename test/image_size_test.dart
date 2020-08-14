import 'package:flutter/cupertino.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'image_size_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for ImageSize. Valid form.', () {
    Image image = new Image.asset('glycine.jpg');
    ImageSizeTest tester = new ImageSizeTest(image);
    bool isValid = ModelState.isValid<ImageSizeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for ImageSize. Invalid form.', () {
    Image image = new Image.asset('erable-japonais.png');
    ImageSizeTest tester = new ImageSizeTest(image);
    bool isValid = ModelState.isValid<ImageSizeTest>(tester);
    expect(isValid, false);

    expect(ModelState.errors['value'].validatorType, ImageSize);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'Taille d\'image incorrecte');
  });
}

@flutterModelFormValidator
class ImageSizeTest {
  ImageSizeTest(this.value);

  @ImageSize(
    minWidth: 500,
    minHeight: 500,
    maxWidth: 1000,
    maxHeight: 1000,
    error: 'Taille d\'image incorrecte',
  )
  final Image value;
}
