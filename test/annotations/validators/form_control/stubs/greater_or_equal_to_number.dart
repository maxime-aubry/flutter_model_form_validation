import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _GreaterOrEqualToNumberStub
    extends IStub<FormControl<num>, GreaterOrEqualToNumber> {
  _GreaterOrEqualToNumberStub({
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
    super.validator = GreaterOrEqualToNumber(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class GreaterOrEqualToNumber_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterOrEqualToNumberStub {
  GreaterOrEqualToNumber_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          fcValue: 1,
          validatorValueToCompare: 0,
        ) {}
}

class GreaterOrEqualToNumber_ValueEqualsValueToCompare_Stub
    extends _GreaterOrEqualToNumberStub {
  GreaterOrEqualToNumber_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 0,
        ) {}
}

class GreaterOrEqualToNumber_ValueIsNull_Stub
    extends _GreaterOrEqualToNumberStub {
  GreaterOrEqualToNumber_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class GreaterOrEqualToNumber_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterOrEqualToNumberStub {
  GreaterOrEqualToNumber_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 1,
        ) {}
}

/* Remote parameters are provided */
class GreaterOrEqualToNumber_ValueToCompareOnPropertyIsProvided_Stub
    extends _GreaterOrEqualToNumberStub {
  GreaterOrEqualToNumber_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 1,
          fcValueToCompare: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* Exceptions on parameters */
class GreaterOrEqualToNumber_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _GreaterOrEqualToNumberStub {
  GreaterOrEqualToNumber_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(fcValue: 1) {}
}
