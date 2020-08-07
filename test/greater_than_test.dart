import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'greater_than_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for GreaterThan. Valid form.', () {
    GreaterThanTest tester = new GreaterThanTest(
      5,
      4,
      8,
      7,
    );
    bool isValid = ModelState.isValid<GreaterThanTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for GreaterThan. Invalid form.', () {
    GreaterThanTest tester = new GreaterThanTest(8, 15, 10, 11);
    bool isValid = ModelState.isValid<GreaterThanTest>(tester);
    expect(isValid, false);

    expect(ModelState.errors['a'].validatorType, GreaterThan);
    expect(ModelState.errors['a'].propertyName, 'a');
    expect(ModelState.errors['a'].error,
        '"a" property must be greater or equal to "b" property');

    expect(ModelState.errors['c'].validatorType, GreaterThan);
    expect(ModelState.errors['c'].propertyName, 'c');
    expect(ModelState.errors['c'].error,
        '"c" property must be greater or equal to "d" property');
  });
}

@flutterModelFormValidator
class GreaterThanTest {
  GreaterThanTest(this.a, this.b, this.c, this.d);

  @GreaterThan(
    propertyName: 'b',
    error: '"a" property must be greater or equal to "b" property',
  )
  final int a;
  final int b;

  @GreaterThan(
    propertyName: 'd',
    error: '"c" property must be greater or equal to "d" property',
  )
  final int c;
  final int d;
}
