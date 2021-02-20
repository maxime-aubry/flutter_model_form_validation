import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _RegularExpressionStub
    extends ValidatorStub<FormControl<String>, RegularExpression> {
  _RegularExpressionStub({
    String value,
    String localExpression,
  }) {
    FormControl<String> _value = new FormControl<String>(
      value: value,
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
      expression: localExpression,
      error: null,
    );
  }
}

/* Value is valid */
class RegularExpression_ValueMatchesToRegexp_Stub
    extends _RegularExpressionStub {
  RegularExpression_ValueMatchesToRegexp_Stub()
      : super(
          value: 'Hello',
          localExpression: r'^Hello|Bye$',
        );
}

class RegularExpression_ValueIsNull_Stub extends _RegularExpressionStub {
  RegularExpression_ValueIsNull_Stub()
      : super(
          value: null,
          localExpression: r'^Hello|Bye$',
        );
}

class RegularExpression_ValueIsEmpty_Stub extends _RegularExpressionStub {
  RegularExpression_ValueIsEmpty_Stub()
      : super(
          value: '',
          localExpression: r'^Hello|Bye$',
        );
}

/* Value is not valid */
class RegularExpression_ValueDoesNotMatchToRegexp_Stub
    extends _RegularExpressionStub {
  RegularExpression_ValueDoesNotMatchToRegexp_Stub()
      : super(
          value: 'Hello world!',
          localExpression: r'^Hello|Bye$',
        );
}

/* Remote parameters are provided */

/* Exceptions */
class RegularExpression_ThrowsValidatorParameterExceptionOnNullExpression_Stub
    extends _RegularExpressionStub {
  RegularExpression_ThrowsValidatorParameterExceptionOnNullExpression_Stub()
      : super(
          value: 'Hello',
        );
}
