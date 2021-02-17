import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _RegularExpressionStub
    extends ValidatorStub<FormControl<String>, RegularExpression> {
  _RegularExpressionStub({
    String fcValue,
    String validatorExpression,
  }) {
    FormControl<String> _value = new FormControl<String>(
      value: fcValue,
      validators: [],
    );
    FormGroup _root = new FormGroup(
      controls: {
        'value': _value,
      },
      validators: [],
    );
    _value.parentGroup = _root;

    super.control = _value;
    super.validator = RegularExpression(
      expression: validatorExpression,
      error: 'invalid expression',
    );
  }
}

/* Value is valid */
class RegularExpression_ValueMatchesToRegexp_Stub
    extends _RegularExpressionStub {
  RegularExpression_ValueMatchesToRegexp_Stub()
      : super(
          fcValue: 'Hello',
          validatorExpression: r'^Hello|Bye$',
        );
}

class RegularExpression_ValueIsNull_Stub extends _RegularExpressionStub {
  RegularExpression_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorExpression: r'^Hello|Bye$',
        );
}

class RegularExpression_ValueIsEmpty_Stub extends _RegularExpressionStub {
  RegularExpression_ValueIsEmpty_Stub()
      : super(
          fcValue: '',
          validatorExpression: r'^Hello|Bye$',
        );
}

/* Value is not valid */
class RegularExpression_ValueDoesNotMatchToRegexp_Stub
    extends _RegularExpressionStub {
  RegularExpression_ValueDoesNotMatchToRegexp_Stub()
      : super(
          fcValue: 'Hello world!',
          validatorExpression: r'^Hello|Bye$',
        );
}

/* Remote parameters are provided */

/* Exceptions on parameters */
class RegularExpression_ThrowsValidatorParameterExceptionOnNullExpression_Stub
    extends _RegularExpressionStub {
  RegularExpression_ThrowsValidatorParameterExceptionOnNullExpression_Stub()
      : super(
          fcValue: 'Hello',
        );
}
