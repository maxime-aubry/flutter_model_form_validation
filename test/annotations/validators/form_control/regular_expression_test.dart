import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import 'stubs/regular_expression.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > RegularExpression.',
      () {
    group('Valid.', () {
      test('value matches to regexp.', () async {
        RegularExpression_ValueMatchesToRegexp_Stub stub =
            new RegularExpression_ValueMatchesToRegexp_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        RegularExpression_ValueIsNull_Stub stub =
            new RegularExpression_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is not valid.', () async {
        RegularExpression_ValueDoesNotMatchToRegexp_Stub stub =
            new RegularExpression_ValueDoesNotMatchToRegexp_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Exceptions.', () {
      test(
          'Throws an exception of ValidatorParameterException type when expression is null.',
          () async {
        RegularExpression_ThrowsValidatorParameterExceptionOnNullExpression_Stub
            stub =
            new RegularExpression_ThrowsValidatorParameterExceptionOnNullExpression_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'Regular expression is not defined.');
      });
    });
  });
}
