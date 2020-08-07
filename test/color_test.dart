import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'color_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for Color. Color type is provided by developer and user. Valid form.', () {
    ColorWithBothTypesTest tester =
        new ColorWithBothTypesTest('#50a832', ColorType.hex);
    bool isValid = ModelState.isValid<ColorWithBothTypesTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for Color. Color type is provided by developer and user. Invalid form.', () {
    ColorWithBothTypesTest tester =
        new ColorWithBothTypesTest('#50a832', ColorType.rgb);
    bool isValid = ModelState.isValid<ColorWithBothTypesTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, Color);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid color');
  });

  test('Test for Color. Color type is provided by developer. Valid form.', () {
    ColorWithDeveloperTypeTest tester = new ColorWithDeveloperTypeTest('#50a832');
    bool isValid = ModelState.isValid<ColorWithDeveloperTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for Color. Color type is provided by developer. Invalid form.', () {
    ColorWithDeveloperTypeTest tester = new ColorWithDeveloperTypeTest('#50g832');
    bool isValid = ModelState.isValid<ColorWithDeveloperTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, Color);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid color');
  });

  test('Test for Color. Color type is provided by user (hex). Valid form.', () {
    ColorWithUserTypeTest tester =
        new ColorWithUserTypeTest('50a832', ColorType.hex);
    bool isValid = ModelState.isValid<ColorWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for Color. Color type is provided by user (hex). Invalid form.', () {
    ColorWithUserTypeTest tester =
        new ColorWithUserTypeTest('50g832', ColorType.hex);
    bool isValid = ModelState.isValid<ColorWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, Color);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid color');
  });

  test('Test for Color. Color type is provided by user (rgb). Valid form.', () {
    ColorWithUserTypeTest tester =
        new ColorWithUserTypeTest('rgb(80, 168, 50)', ColorType.rgb);
    bool isValid = ModelState.isValid<ColorWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for Color. Color type is provided by user (rgb). Invalid form.', () {
    ColorWithUserTypeTest tester =
        new ColorWithUserTypeTest('rgb(256, 168, 50)', ColorType.rgb);
    bool isValid = ModelState.isValid<ColorWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, Color);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid color');
  });

  test('Test for Color. Color type is provided by user (hsl). Valid form.', () {
    ColorWithUserTypeTest tester =
        new ColorWithUserTypeTest('hsl(105, 54%, 43%)', ColorType.hsl);
    bool isValid = ModelState.isValid<ColorWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for Color. Color type is provided by user (hsl). Invalid form.', () {
    ColorWithUserTypeTest tester =
        new ColorWithUserTypeTest('hsl(105, 101%, 43%)', ColorType.hsl);
    bool isValid = ModelState.isValid<ColorWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, Color);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid color');
  });

  test('Test for Color. Color type is provided by user (hwb). Valid form.', () {
    ColorWithUserTypeTest tester =
        new ColorWithUserTypeTest('hwb(105, 20%, 34%)', ColorType.hwb);
    bool isValid = ModelState.isValid<ColorWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for Color. Color type is provided by user (hwb). Invalid form.', () {
    ColorWithUserTypeTest tester =
        new ColorWithUserTypeTest('hwb(105, 101%, 34%)', ColorType.hwb);
    bool isValid = ModelState.isValid<ColorWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, Color);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid color');
  });

  test('Test for Color. Color type is provided by user (cmyk). Valid form.', () {
    ColorWithUserTypeTest tester =
        new ColorWithUserTypeTest('cmyk(52%, 0%, 70%, 34%)', ColorType.cmyk);
    bool isValid = ModelState.isValid<ColorWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for Color. Color type is provided by user (cmyk). Invalid form.', () {
    ColorWithUserTypeTest tester =
        new ColorWithUserTypeTest('cmyk(101%, 0%, 70%, 34%)', ColorType.cmyk);
    bool isValid = ModelState.isValid<ColorWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, Color);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid color');
  });

  test('Test for Color. Color type is provided by user (ncol). Valid form.', () {
    ColorWithUserTypeTest tester =
        new ColorWithUserTypeTest('Y75, 20%, 34%', ColorType.ncol);
    bool isValid = ModelState.isValid<ColorWithUserTypeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for Color. Color type is provided by user (ncol). Invalid form.', () {
    ColorWithUserTypeTest tester =
        new ColorWithUserTypeTest('Y100, 101%, 34%', ColorType.ncol);
    bool isValid = ModelState.isValid<ColorWithUserTypeTest>(tester);
    expect(isValid, false);
    expect(ModelState.errors['value'].validatorType, Color);
    expect(ModelState.errors['value'].propertyName, 'value');
    expect(ModelState.errors['value'].error, 'invalid color');
  });
}

@easyValidator
class ColorWithBothTypesTest {
  ColorWithBothTypesTest(this.value, this.colorType);

  @Color(
      colorTypeOnProperty: 'colorType',
      colorType: ColorType.rgb,
      error: 'invalid color')
  final String value;

  final ColorType colorType;
}

@easyValidator
class ColorWithDeveloperTypeTest {
  ColorWithDeveloperTypeTest(this.value);

  @Color(colorType: ColorType.hex, error: 'invalid color')
  final String value;
}

@easyValidator
class ColorWithUserTypeTest {
  ColorWithUserTypeTest(this.value, this.colorType);

  @Color(colorTypeOnProperty: 'colorType', error: 'invalid color')
  final String value;

  final ColorType colorType;
}
