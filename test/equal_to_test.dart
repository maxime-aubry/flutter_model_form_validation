import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'equal_to_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for EqualTo. Valid form.', () {
    EqualToTest tester = new EqualToTest(
      DateTime.now(),
      DateTime.now(),
      1,
      1,
      2.0,
      2.0,
      'azerty',
      'azerty',
    );
    bool isValid = ModelState.isValid<EqualToTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for EqualTo. Invalid form.', () {
    EqualToTest tester = new EqualToTest(
      DateTime.now(),
      DateTime.parse('2019-01-01'),
      1,
      2,
      2.0,
      2.5,
      'azerty',
      'ytreza',
    );
    bool isValid = ModelState.isValid<EqualToTest>(tester);
    expect(isValid, false);

    expect(ModelState.errors['a'].validatorType, EqualTo);
    expect(ModelState.errors['a'].propertyName, 'a');
    expect(ModelState.errors['a'].error,
        '"a" property must be equal to "b" property');

    expect(ModelState.errors['c'].validatorType, EqualTo);
    expect(ModelState.errors['c'].propertyName, 'c');
    expect(ModelState.errors['c'].error,
        '"c" property must be equal to "d" property');

    expect(ModelState.errors['e'].validatorType, EqualTo);
    expect(ModelState.errors['e'].propertyName, 'e');
    expect(ModelState.errors['e'].error,
        '"a" property must be equal to "b" property');

    expect(ModelState.errors['g'].validatorType, EqualTo);
    expect(ModelState.errors['g'].propertyName, 'g');
    expect(ModelState.errors['g'].error,
        '"g" property must be equal to "h" property');
  });
}

@easyValidator
class EqualToTest {
  EqualToTest(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h);

  @EqualTo(
    propertyName: 'b',
    error: '"a" property must be equal to "b" property',
  )
  final DateTime a;
  final DateTime b;

  @EqualTo(
    propertyName: 'd',
    error: '"c" property must be equal to "d" property',
  )
  final int c;
  final int d;

  @EqualTo(
    propertyName: 'f',
    error: '"a" property must be equal to "b" property',
  )
  final double e;
  final double f;

  @EqualTo(
    propertyName: 'h',
    error: '"g" property must be equal to "h" property',
  )
  final String g;
  final String h;
}
