import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';

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

class GreaterThanDouble_ValueAndValueToCompareAreNull_Stub
    extends _GreaterThanDoubleStub {
  GreaterThanDouble_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

class GreaterThanDouble_ValueIsNull_Stub extends _GreaterThanDoubleStub {
  GreaterThanDouble_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 1,
        ) {}
}

class GreaterThanDouble_ValueToCompareIsNull_Stub
    extends _GreaterThanDoubleStub {
  GreaterThanDouble_ValueToCompareIsNull_Stub()
      : super(
          value: 1,
          localValueToCompare: null,
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

class GreaterThanDouble_ValueIsEqualToValueToCompare_Stub
    extends _GreaterThanDoubleStub {
  GreaterThanDouble_ValueIsEqualToValueToCompare_Stub()
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
          value: 2,
          remoteValueToCompare: 1,
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 10,
        ) {}
}

/* Exceptions */
