import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'required_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for Required. Valid form.', () {
    RequiredTest tester = new RequiredTest('azerty', 'ytreza');
    bool isValid = ModelState.isValid<RequiredTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for Required. Invalid form.', () {
    RequiredTest tester = new RequiredTest('', null);
    bool isValid = ModelState.isValid<RequiredTest>(tester);
    expect(isValid, false);

    expect(ModelState.errors['a'].validatorType, Required);
    expect(ModelState.errors['a'].propertyName, 'a');
    expect(ModelState.errors['a'].error, '"a" is required');

    expect(ModelState.errors['b'].validatorType, Required);
    expect(ModelState.errors['b'].propertyName, 'b');
    expect(ModelState.errors['b'].error, '"b" is required');
  });
}

@flutterModelFormValidator
class RequiredTest {
  RequiredTest(this.a, this.b);

  @Required(error: '"a" is required')
  final String a;

  @Required(error: '"b" is required')
  final String b;
}
