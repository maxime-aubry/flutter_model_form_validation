import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'range_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for Range. Valid form.', () {
    RangeTest tester = new RangeTest(75, DateTime.parse('2019-09-09'));
    bool isValid = ModelState.isValid<RangeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for Range. Invalid form.', () {
    RangeTest tester = new RangeTest(25, DateTime.parse('2018-09-09'));
    bool isValid = ModelState.isValid<RangeTest>(tester);
    expect(isValid, false);

    expect(ModelState.errors['a'].validatorType, NumberRange);
    expect(ModelState.errors['a'].propertyName, 'a');
    expect(ModelState.errors['a'].error,
        '"a" property must be between 50 and 100');

    expect(ModelState.errors['b'].validatorType, DateTimeRange);
    expect(ModelState.errors['b'].propertyName, 'b');
    expect(ModelState.errors['b'].error,
        '"b" property must be between 2019/01/01 and 2019/31/12');
  });
}

@flutterModelFormValidator
class RangeTest {
  RangeTest(this.a, this.b);

  @NumberRange(
    min: 50,
    max: 100,
    error: '"a" property must be between 50 and 100',
  )
  final int a;

  @DateTimeRange(
    min: '2019-01-01',
    max: null,
    error: '"b" property must be between 2019/01/01 and 2019/31/12',
  )
  final DateTime b;
}
