import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _StringLengthStub extends IStub<FormControl<String>, StringLength> {
  _StringLengthStub({
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
    super.validator = StringLength(
      min: 0,
      max: 0,
      error: 'invalid string length',
    );
  }
}

/* Value is valid */
class StringLength_ValueMatchesToRegexp_Stub extends _StringLengthStub {
  StringLength_ValueMatchesToRegexp_Stub()
      : super(
          fcValue: 'Hello',
          validatorExpression: r'^Hello|Bye$',
        );
}

class StringLength_ValueIsNull_Stub extends _StringLengthStub {
  StringLength_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorExpression: r'^Hello|Bye$',
        );
}

class StringLength_ValueIsEmpty_Stub extends _StringLengthStub {
  StringLength_ValueIsEmpty_Stub()
      : super(
          fcValue: '',
          validatorExpression: r'^Hello|Bye$',
        );
}

/* Value is not valid */
class StringLength_ValueDoesNotMatchToRegexp_Stub extends _StringLengthStub {
  StringLength_ValueDoesNotMatchToRegexp_Stub()
      : super(
          fcValue: 'Hello world!',
          validatorExpression: r'^Hello|Bye$',
        );
}

/* Remote parameters are provided */

/* Exceptions on parameters */
class StringLength_ThrowsValidatorParameterExceptionOnNullExpression_Stub
    extends _StringLengthStub {
  StringLength_ThrowsValidatorParameterExceptionOnNullExpression_Stub()
      : super(
          fcValue: 'Hello',
        );
}
