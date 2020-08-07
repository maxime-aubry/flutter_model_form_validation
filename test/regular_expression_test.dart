import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'regular_expression_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for RegularExpression. Valid form.', () {
    RegularExpressionTest tester = new RegularExpressionTest('Hello');
    bool isValid = ModelState.isValid<RegularExpressionTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for RegularExpression. Invalid form.', () {
    RegularExpressionTest tester = new RegularExpressionTest('Good morning');
    bool isValid = ModelState.isValid<RegularExpressionTest>(tester);
    expect(isValid, false);

    expect(ModelState.errors['a'].validatorType, RegularExpression);
    expect(ModelState.errors['a'].propertyName, 'a');
    expect(ModelState.errors['a'].error, 'invalid regular expression');
  });
}

@flutterModelFormValidator
class RegularExpressionTest {
  RegularExpressionTest(this.a);

  @RegularExpression(
      expression: r'^Hello|Bye$', error: 'invalid regular expression')
  final String a;
}
