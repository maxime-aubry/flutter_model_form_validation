import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _EqualToDoubleStub
    extends ValidatorStub<FormControl<double>, EqualToDouble> {
  _EqualToDoubleStub({
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
    super.validator = EqualToDouble(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class EqualToDouble_ValueIsEqualToValueToCompare_Stub extends _EqualToDoubleStub {
  EqualToDouble_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 0,
        ) {}
}

class EqualToDouble_ValueAndValueToCompareAreNull_Stub
    extends _EqualToDoubleStub {
  EqualToDouble_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class EqualToDouble_ValueIsNull_Stub extends _EqualToDoubleStub {
  EqualToDouble_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 0,
        ) {}
}

class EqualToDouble_ValueToCompareIsNull_Stub extends _EqualToDoubleStub {
  EqualToDouble_ValueToCompareIsNull_Stub()
      : super(
          value: 0,
          localValueToCompare: null,
        ) {}
}

class EqualToDouble_ValueIsSmallerThanValueToCompare_Stub
    extends _EqualToDoubleStub {
  EqualToDouble_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 1,
        ) {}
}

class EqualToDouble_ValueIsGreaterThanValueToCompare_Stub
    extends _EqualToDoubleStub {
  EqualToDouble_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 1,
          localValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class EqualToDouble_remoteValueToCompareIsProvided_Stub
    extends _EqualToDoubleStub {
  EqualToDouble_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 1,
          remoteValueToCompare: 1,
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 0,
        ) {}
}

/* Exceptions */
