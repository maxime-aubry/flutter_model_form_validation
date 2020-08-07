import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'greater_or_equal_to_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for GreaterOrEqualTo. Valid form.', () {
    GreaterOrEqualToTest tester = new GreaterOrEqualToTest(
      5,
      4,
      7,
      7,
    );
    bool isValid = ModelState.isValid<GreaterOrEqualToTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for GreaterOrEqualTo. Invalid form.', () {
    GreaterOrEqualToTest tester = new GreaterOrEqualToTest(
      8,
      15,
      10,
      11,
    );
    bool isValid = ModelState.isValid<GreaterOrEqualToTest>(tester);
    expect(isValid, false);

    expect(ModelState.errors['a'].validatorType, GreaterOrEqualTo);
    expect(ModelState.errors['a'].propertyName, 'a');
    expect(ModelState.errors['a'].error,
        '"a" property must be greater or equal to "b" property');

    expect(ModelState.errors['c'].validatorType, GreaterOrEqualTo);
    expect(ModelState.errors['c'].propertyName, 'c');
    expect(ModelState.errors['c'].error,
        '"c" property must be greater or equal to "d" property');
  });
}

@flutterModelFormValidator
class GreaterOrEqualToTest {
  GreaterOrEqualToTest(this.a, this.b, this.c, this.d);

  @GreaterOrEqualTo(
    propertyName: 'b',
    error: '"a" property must be greater or equal to "b" property',
  )
  final int a;
  final int b;

  @GreaterOrEqualTo(
    propertyName: 'd',
    error: '"c" property must be greater or equal to "d" property',
  )
  final int c;
  final int d;
}
