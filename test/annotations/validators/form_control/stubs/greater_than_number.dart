import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _GreaterThanNumberStub
    extends IStub<FormControl<num>, GreaterThanNumber> {
  _GreaterThanNumberStub({
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
    super.validator = GreaterThanNumber(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class GreaterThanNumber_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterThanNumberStub {
  GreaterThanNumber_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          fcValue: 1,
          validatorValueToCompare: 0,
        ) {}
}

class GreaterThanNumber_NullValue_Stub extends _GreaterThanNumberStub {
  GreaterThanNumber_NullValue_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class GreaterThanNumber_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterThanNumberStub {
  GreaterThanNumber_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: -1,
          validatorValueToCompare: 0,
        ) {}
}

class GreaterThanNumber_ValueEqualsValueToCompare_Stub
    extends _GreaterThanNumberStub {
  GreaterThanNumber_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class GreaterThanNumber_ValueToCompareOnPropertyIsProvided_Stub
    extends _GreaterThanNumberStub {
  GreaterThanNumber_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 1,
          fcValueToCompare: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* None parameter is provided */
class GreaterThanNumber_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _GreaterThanNumberStub {
  GreaterThanNumber_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub() : super(fcValue: 1) {}
}
