import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'string_length_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for StringLength. Valid form.', () {
    StringLengthTest tester = new StringLengthTest('Hello everybody');
    bool isValid = ModelState.isValid<StringLengthTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for StringLength. Invalid form.', () {
    StringLengthTest tester = new StringLengthTest('No, I am your father !');
    bool isValid = ModelState.isValid<StringLengthTest>(tester);
    expect(isValid, false);

    expect(ModelState.errors['a'].validatorType, StringLength);
    expect(ModelState.errors['a'].propertyName, 'a');
    expect(ModelState.errors['a'].error,
        '"a" property must have between 10 and 20 characters');
  });
}

@flutterModelFormValidator
class StringLengthTest {
  StringLengthTest(this.a);

  @StringLength(
      min: 10,
      max: 20,
      error: '"a" property must have between 10 and 20 characters')
  final String a;
}
