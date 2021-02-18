import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _GreaterThanDoubleStub
    extends ValidatorStub<FormControl<double>, GreaterThanDouble> {
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
      remoteValueToCompare:
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

class GreaterThanDouble_ValueIsNull_Stub extends _GreaterThanDoubleStub {
  GreaterThanDouble_ValueIsNull_Stub()
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
class GreaterThanDouble_remoteValueToCompareIsProvided_Stub
    extends _GreaterThanDoubleStub {
  GreaterThanDouble_remoteValueToCompareIsProvided_Stub()
      : super(
          fcValue: 1,
          fcValueToCompare: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* Exceptions on parameters */
class GreaterThanDouble_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _GreaterThanDoubleStub {
  GreaterThanDouble_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(fcValue: 1) {}
}
