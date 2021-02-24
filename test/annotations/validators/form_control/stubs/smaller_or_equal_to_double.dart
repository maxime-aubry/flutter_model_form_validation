import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';

class _SmallerOrEqualToDoubleStub
    extends ValidatorStub<FormControl<double>, SmallerOrEqualToDouble> {
  _SmallerOrEqualToDoubleStub({
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

    _value.parent = _root;
    _valueToCompare.parent = _root;

    super.control = _value;
    super.validator = SmallerOrEqualToDouble(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class SmallerOrEqualToDouble_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 1,
        ) {}
}

class SmallerOrEqualToDouble_ValueIsEqualToValueToCompare_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 1,
        ) {}
}

class SmallerOrEqualToDouble_ValueAndValueToCompareAreNull_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

class SmallerOrEqualToDouble_ValueIsNull_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 1,
        ) {}
}

class SmallerOrEqualToDouble_ValueToCompareIsNull_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_ValueToCompareIsNull_Stub()
      : super(
          value: 0,
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class SmallerOrEqualToDouble_ValueIsGreaterThanValueToCompare_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 2,
          localValueToCompare: 1,
        ) {}
}

/* Remote parameters are provided */
class SmallerOrEqualToDouble_remoteValueToCompareIsProvided_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 2,
          remoteValueToCompare: 2,
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 1,
        ) {}
}

/* Exceptions */
