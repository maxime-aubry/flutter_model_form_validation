import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'contains_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for Contains. Valid form.', () {
    ContainsTest tester = new ContainsTest(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
    bool isValid = ModelState.isValid<ContainsTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for Contains. Invalid form.', () {
    ContainsTest tester = new ContainsTest(
        '...sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
    bool isValid = ModelState.isValid<ContainsTest>(tester);
    expect(isValid, false);

    expect(ModelState.errors['a'].validatorType, Contains);
    expect(ModelState.errors['a'].propertyName, 'a');
    expect(ModelState.errors['a'].error, 'missing keyword');
  });
}

@flutterModelFormValidator
class ContainsTest {
  ContainsTest(this.a);

  @Contains(
    words: ['amet', 'adipiscing', 'tempor'],
    error: 'missing keyword',
  )
  final String a;
}
