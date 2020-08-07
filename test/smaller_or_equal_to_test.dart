import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'smaller_or_equal_to_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for SmallerOrEqualTo. Valid form.', () {
    SmallerOrEqualToTest tester = new SmallerOrEqualToTest(
      4,
      5,
      7,
      7,
    );
    bool isValid = ModelState.isValid<SmallerOrEqualToTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for SmallerOrEqualTo. Invalid form.', () {
    SmallerOrEqualToTest tester = new SmallerOrEqualToTest(
      15,
      8,
      11,
      10,
    );
    bool isValid = ModelState.isValid<SmallerOrEqualToTest>(tester);
    expect(isValid, false);

    expect(ModelState.errors['a'].validatorType, SmallerOrEqualTo);
    expect(ModelState.errors['a'].propertyName, 'a');
    expect(ModelState.errors['a'].error,
        '"a" property must be smaller or equal to "b" property');

    expect(ModelState.errors['c'].validatorType, SmallerOrEqualTo);
    expect(ModelState.errors['c'].propertyName, 'c');
    expect(ModelState.errors['c'].error,
        '"c" property must be smaller or equal to "d" property');
  });
}

@flutterModelFormValidator
class SmallerOrEqualToTest {
  SmallerOrEqualToTest(this.a, this.b, this.c, this.d);

  @SmallerOrEqualTo(
    propertyName: 'b',
    error: '"a" property must be smaller or equal to "b" property',
  )
  final int a;
  final int b;

  @SmallerOrEqualTo(
    propertyName: 'd',
    error: '"c" property must be smaller or equal to "d" property',
  )
  final int c;
  final int d;
}
