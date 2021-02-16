import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _GreaterOrEqualToStringStub
    extends IStub<FormControl<String>, GreaterOrEqualToString> {
  _GreaterOrEqualToStringStub({
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
    super.validator = GreaterOrEqualToString(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class GreaterOrEqualToString_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          fcValue: 'b',
          validatorValueToCompare: 'a',
        ) {}
}

class GreaterOrEqualToString_ValueEqualsValueToCompare_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 'a',
          validatorValueToCompare: 'a',
        ) {}
}

class GreaterOrEqualToString_ValueIsNull_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 'a',
        ) {}
}

/* Value is not valid */
class GreaterOrEqualToString_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: 'a',
          validatorValueToCompare: 'b',
        ) {}
}

/* Remote parameters are provided */
class GreaterOrEqualToString_ValueToCompareOnPropertyIsProvided_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 'b',
          fcValueToCompare: 'b',
          validatorValueToCompare: 'a',
        ) {}
}

/* Exceptions on parameters */
class GreaterOrEqualToString_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(fcValue: 'b') {}
}
