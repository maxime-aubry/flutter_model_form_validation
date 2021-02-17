import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _EqualToStringStub
    extends ValidatorStub<FormControl<String>, EqualToString> {
  _EqualToStringStub({
    String fcValue,
    String fcValueToCompare,
    String validatorValueToCompare,
  }) {
    FormControl<String> _value = new FormControl<String>(
      value: fcValue,
      validators: [],
    );
    FormControl<String> _valueToCompare = new FormControl<String>(
      value: fcValueToCompare,
      validators: [],
    );
    FormGroup _root = new FormGroup(
      controls: {
        'value': _value,
        'valueToCompare': _valueToCompare,
      },
      validators: [],
    );
    _value.parentGroup = _root;
    _valueToCompare.parentGroup = _root;

    super.control = _value;
    super.validator = EqualToString(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class EqualToString_ValueEqualsValueToCompare_Stub extends _EqualToStringStub {
  EqualToString_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 'a',
          validatorValueToCompare: 'a',
        ) {}
}

class EqualToString_ValueIsNull_Stub extends _EqualToStringStub {
  EqualToString_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 'a',
        ) {}
}

class EqualToString_EmptyValue_Stub extends _EqualToStringStub {
  EqualToString_EmptyValue_Stub()
      : super(
          fcValue: '',
          validatorValueToCompare: 'a',
        ) {}
}

/* Value is not valid */
class EqualToString_ValueDoesNotEqualValueToCompare_Stub
    extends _EqualToStringStub {
  EqualToString_ValueDoesNotEqualValueToCompare_Stub()
      : super(
          fcValue: 'b',
          validatorValueToCompare: 'a',
        ) {}
}

/* Remote parameters are provided */
class EqualToString_ValueToCompareOnPropertyIsProvided_Stub
    extends _EqualToStringStub {
  EqualToString_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 'b',
          fcValueToCompare: 'b',
          validatorValueToCompare: 'a',
        ) {}
}

/* Exceptions on parameters */
class EqualToString_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _EqualToStringStub {
  EqualToString_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(fcValue: 'a') {}
}
