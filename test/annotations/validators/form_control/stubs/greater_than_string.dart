import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _GreaterThanStringStub
    extends ValidatorStub<FormControl<String>, GreaterThanString> {
  _GreaterThanStringStub({
    String value,
    String remoteValueToCompare,
    String remoteValueToCompareName = 'valueToCompare',
    String localValueToCompare,
  }) {
    FormControl<String> _value = new FormControl<String>(
      value: value,
      validators: [],
    );
    FormControl<String> _valueToCompare = new FormControl<String>(
      value: remoteValueToCompare,
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
    super.validator = GreaterThanString(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class GreaterThanString_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterThanStringStub {
  GreaterThanString_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 'b',
          localValueToCompare: 'a',
        ) {}
}

class GreaterThanString_ValueIsNull_Stub extends _GreaterThanStringStub {
  GreaterThanString_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 'a',
        ) {}
}

/* Value is not valid */
class GreaterThanString_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterThanStringStub {
  GreaterThanString_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 'a',
          localValueToCompare: 'b',
        ) {}
}

class GreaterThanString_ValueEqualsValueToCompare_Stub
    extends _GreaterThanStringStub {
  GreaterThanString_ValueEqualsValueToCompare_Stub()
      : super(
          value: 'a',
          localValueToCompare: 'b',
        ) {}
}

/* Remote parameters are provided */
class GreaterThanString_remoteValueToCompareIsProvided_Stub
    extends _GreaterThanStringStub {
  GreaterThanString_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 'b',
          remoteValueToCompare: 'b',
          localValueToCompare: 'a',
        ) {}
}

/* Exceptions on parameters */
class GreaterThanString_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _GreaterThanStringStub {
  GreaterThanString_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(value: 'b') {}
}
