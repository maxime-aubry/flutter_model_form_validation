import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _NotEqualToNumberStub
    extends ValidatorStub<FormControl<num>, NotEqualToNumber> {
  _NotEqualToNumberStub({
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
    super.validator = NotEqualToNumber(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class NotEqualToNumber_ValueDoesNotEqualValueToCompare_Stub
    extends _NotEqualToNumberStub {
  NotEqualToNumber_ValueDoesNotEqualValueToCompare_Stub()
      : super(
          fcValue: 1,
          validatorValueToCompare: 0,
        ) {}
}

class NotEqualToNumber_ValueIsNull_Stub extends _NotEqualToNumberStub {
  NotEqualToNumber_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class NotEqualToNumber_ValueEqualsValueToCompare_Stub
    extends _NotEqualToNumberStub {
  NotEqualToNumber_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class NotEqualToNumber_ValueToCompareOnPropertyIsProvided_Stub
    extends _NotEqualToNumberStub {
  NotEqualToNumber_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 1,
          fcValueToCompare: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* Exceptions on parameters */
class NotEqualToNumber_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _NotEqualToNumberStub {
  NotEqualToNumber_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(fcValue: 0) {}
}
