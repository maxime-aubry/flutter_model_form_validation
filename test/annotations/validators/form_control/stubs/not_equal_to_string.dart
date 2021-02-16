import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _NotEqualToStringStub
    extends IStub<FormControl<String>, NotEqualToString> {
  _NotEqualToStringStub({
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
    super.validator = NotEqualToString(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class NotEqualToString_ValueDoesNotEqualValueToCompare_Stub
    extends _NotEqualToStringStub {
  NotEqualToString_ValueDoesNotEqualValueToCompare_Stub()
      : super(
          fcValue: 'b',
          validatorValueToCompare: 'a',
        ) {}
}

class NotEqualToString_ValueIsNull_Stub extends _NotEqualToStringStub {
  NotEqualToString_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 'a',
        ) {}
}

class NotEqualToString_EmptyValue_Stub extends _NotEqualToStringStub {
  NotEqualToString_EmptyValue_Stub()
      : super(
          fcValue: '',
          validatorValueToCompare: 'a',
        ) {}
}

/* Value is not valid */
class NotEqualToString_ValueEqualsValueToCompare_Stub
    extends _NotEqualToStringStub {
  NotEqualToString_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 'a',
          validatorValueToCompare: 'a',
        ) {}
}

/* Remote parameters are provided */
class NotEqualToString_ValueToCompareOnPropertyIsProvided_Stub
    extends _NotEqualToStringStub {
  NotEqualToString_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 'b',
          fcValueToCompare: 'b',
          validatorValueToCompare: 'a',
        ) {}
}

/* None parameter is provided */
class NotEqualToString_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _NotEqualToStringStub {
  NotEqualToString_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(fcValue: 'a') {}
}
