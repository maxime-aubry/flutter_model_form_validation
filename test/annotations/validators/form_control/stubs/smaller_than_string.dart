import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _SmallerThanStringStub
    extends IStub<FormControl<String>, SmallerThanString> {
  _SmallerThanStringStub({
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
    super.validator = SmallerThanString(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class SmallerThanString_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerThanStringStub {
  SmallerThanString_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: 'a',
          validatorValueToCompare: 'b',
        ) {}
}

class SmallerThanString_ValueIsNull_Stub extends _SmallerThanStringStub {
  SmallerThanString_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 'a',
        ) {}
}

/* Value is not valid */
class SmallerThanString_ValueIsGreaterThanValueToCompare_Stub
    extends _SmallerThanStringStub {
  SmallerThanString_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          fcValue: 'b',
          validatorValueToCompare: 'a',
        ) {}
}

/* Remote parameters are provided */
class SmallerThanString_ValueToCompareOnPropertyIsProvided_Stub
    extends _SmallerThanStringStub {
  SmallerThanString_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 'a',
          fcValueToCompare: 'a',
          validatorValueToCompare: 'b',
        ) {}
}

/* None parameter is provided */
class SmallerThanString_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _SmallerThanStringStub {
  SmallerThanString_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(fcValue: 'b') {}
}
