import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _GreaterThanDoubleStub
    extends IStub<FormControl<double>, GreaterThanDouble> {
  _GreaterThanDoubleStub({
    double fcValue,
    double fcValueToCompare,
    double validatorValueToCompare,
  }) {
    FormControl<double> _value = new FormControl<double>(
      value: fcValue,
      validators: [],
    );
    FormControl<double> _valueToCompare = new FormControl<double>(
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
    super.validator = GreaterThanDouble(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class GreaterThanDouble_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterThanDoubleStub {
  GreaterThanDouble_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          fcValue: 1,
          validatorValueToCompare: 0,
        ) {}
}

class GreaterThanDouble_NullValue_Stub extends _GreaterThanDoubleStub {
  GreaterThanDouble_NullValue_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class GreaterThanDouble_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterThanDoubleStub {
  GreaterThanDouble_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: -1,
          validatorValueToCompare: 0,
        ) {}
}

class GreaterThanDouble_ValueEqualsValueToCompare_Stub
    extends _GreaterThanDoubleStub {
  GreaterThanDouble_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class GreaterThanDouble_ValueToCompareOnPropertyIsProvided_Stub
    extends _GreaterThanDoubleStub {
  GreaterThanDouble_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 1,
          fcValueToCompare: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* None parameter is provided */
class GreaterThanDouble_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _GreaterThanDoubleStub {
  GreaterThanDouble_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub() : super(fcValue: 1) {}
}
