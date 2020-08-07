import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'smaller_than_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for SmallerThan. Valid form.', () {
    SmallerThanTest tester = new SmallerThanTest(4, 5, 7, 8);
    bool isValid = ModelState.isValid<SmallerThanTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for SmallerThan. Invalid form.', () {
    SmallerThanTest tester = new SmallerThanTest(15, 8, 11, 10);
    bool isValid = ModelState.isValid<SmallerThanTest>(tester);
    expect(isValid, false);

    expect(ModelState.errors['a'].validatorType, SmallerThan);
    expect(ModelState.errors['a'].propertyName, 'a');
    expect(ModelState.errors['a'].error,
        '"a" property must be smaller or equal to "b" property');

    expect(ModelState.errors['c'].validatorType, SmallerThan);
    expect(ModelState.errors['c'].propertyName, 'c');
    expect(ModelState.errors['c'].error,
        '"c" property must be smaller or equal to "d" property');
  });
}

@flutterModelFormValidator
class SmallerThanTest {
  SmallerThanTest(this.a, this.b, this.c, this.d);

  @SmallerThan(
    propertyName: 'b',
    error: '"a" property must be smaller or equal to "b" property',
  )
  final int a;
  final int b;

  @SmallerThan(
    propertyName: 'd',
    error: '"c" property must be smaller or equal to "d" property',
  )
  final int c;
  final int d;
}
