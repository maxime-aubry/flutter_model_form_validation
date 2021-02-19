import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _GreaterThanDoubleStub
    extends ValidatorStub<FormControl<double>, GreaterThanDouble> {
  _GreaterThanDoubleStub({
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
    super.validator = GreaterThanDouble(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class GreaterThanDouble_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterThanDoubleStub {
  GreaterThanDouble_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 1,
          localValueToCompare: 0,
        ) {}
}

class GreaterThanDouble_ValueIsNull_Stub extends _GreaterThanDoubleStub {
  GreaterThanDouble_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class GreaterThanDouble_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterThanDoubleStub {
  GreaterThanDouble_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: -1,
          localValueToCompare: 0,
        ) {}
}

class GreaterThanDouble_ValueEqualsValueToCompare_Stub
    extends _GreaterThanDoubleStub {
  GreaterThanDouble_ValueEqualsValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class GreaterThanDouble_remoteValueToCompareIsProvided_Stub
    extends _GreaterThanDoubleStub {
  GreaterThanDouble_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 1,
          remoteValueToCompare: 1,
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 0,
        ) {}
}

/* Exceptions on parameters */
