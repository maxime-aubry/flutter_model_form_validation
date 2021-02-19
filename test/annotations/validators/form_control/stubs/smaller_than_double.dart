import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _SmallerThanDoubleStub
    extends ValidatorStub<FormControl<double>, SmallerThanDouble> {
  _SmallerThanDoubleStub({
    double value,
    double remoteValueToCompare,
    String remoteValueToCompareName,
    double localValueToCompare,
  }) {
    FormControl<double> _value = new FormControl<double>(
      value: value,
      validators: [],
    );
    FormControl<double> _valueToCompare = new FormControl<double>(
      value: remoteValueToCompare,
      validators: [],
    );

    Map<String, AbstractControl> controls = {'value': _value};
    if (remoteValueToCompareName != null)
      controls[remoteValueToCompareName] = _valueToCompare;

    FormGroup _root = new FormGroup(
      controls: controls,
      validators: [],
    );

    _value.parentGroup = _root;
    _valueToCompare.parentGroup = _root;

    super.control = _value;
    super.validator = SmallerThanDouble(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class SmallerThanDouble_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerThanDoubleStub {
  SmallerThanDouble_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 1,
        ) {}
}

class SmallerThanDouble_ValueIsNull_Stub extends _SmallerThanDoubleStub {
  SmallerThanDouble_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class SmallerThanDouble_ValueIsGreaterThanValueToCompare_Stub
    extends _SmallerThanDoubleStub {
  SmallerThanDouble_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 1,
          localValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class SmallerThanDouble_remoteValueToCompareIsProvided_Stub
    extends _SmallerThanDoubleStub {
  SmallerThanDouble_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 0,
          remoteValueToCompare: 0,
          localValueToCompare: 1,
        ) {}
}

/* Exceptions on parameters */
class SmallerThanDouble_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _SmallerThanDoubleStub {
  SmallerThanDouble_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(value: 1) {}
}
