import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _SmallerThanDoubleStub
    extends ValidatorStub<FormControl<double>, SmallerThanDouble> {
  _SmallerThanDoubleStub({
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
    super.validator = SmallerThanDouble(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class SmallerThanDouble_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerThanDoubleStub {
  SmallerThanDouble_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 1,
        ) {}
}

class SmallerThanDouble_ValueIsNull_Stub extends _SmallerThanDoubleStub {
  SmallerThanDouble_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class SmallerThanDouble_ValueIsGreaterThanValueToCompare_Stub
    extends _SmallerThanDoubleStub {
  SmallerThanDouble_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          fcValue: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class SmallerThanDouble_ValueToCompareOnPropertyIsProvided_Stub
    extends _SmallerThanDoubleStub {
  SmallerThanDouble_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 0,
          fcValueToCompare: 0,
          validatorValueToCompare: 1,
        ) {}
}

/* Exceptions on parameters */
class SmallerThanDouble_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _SmallerThanDoubleStub {
  SmallerThanDouble_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(fcValue: 1) {}
}
