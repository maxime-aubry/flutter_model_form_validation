import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _EqualToNumberStub extends IStub<FormControl<num>, EqualToNumber> {
  _EqualToNumberStub({
    num fcValue,
    num fcValueToCompare,
    num validatorValueToCompare,
  }) {
    FormControl<num> _value = new FormControl<num>(
      value: fcValue,
      validators: [],
    );
    FormControl<num> _valueToCompare = new FormControl<num>(
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
    super.validator = EqualToNumber(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class EqualToNumber_ValueEqualsValueToCompare_Stub extends _EqualToNumberStub {
  EqualToNumber_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 0,
        ) {}
}

class EqualToNumber_NullValue_Stub extends _EqualToNumberStub {
  EqualToNumber_NullValue_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class EqualToNumber_ValueDoesNotEqualValueToCompare_Stub
    extends _EqualToNumberStub {
  EqualToNumber_ValueDoesNotEqualValueToCompare_Stub()
      : super(
          fcValue: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class EqualToNumber_ValueToCompareOnPropertyIsProvided_Stub
    extends _EqualToNumberStub {
  EqualToNumber_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 1,
          fcValueToCompare: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* None parameter is provided */
class EqualToNumber_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _EqualToNumberStub {
  EqualToNumber_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub() : super(fcValue: 0) {}
}
