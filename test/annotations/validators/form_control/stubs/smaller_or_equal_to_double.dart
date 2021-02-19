import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

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

    _value.parentGroup = _root;
    _valueToCompare.parentGroup = _root;

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

class SmallerOrEqualToDouble_ValueEqualsValueToCompare_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_ValueEqualsValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 0,
        ) {}
}

class SmallerOrEqualToDouble_ValueIsNull_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class SmallerOrEqualToDouble_ValueIsGreterThanValueToCompare_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_ValueIsGreterThanValueToCompare_Stub()
      : super(
          value: 1,
          localValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class SmallerOrEqualToDouble_remoteValueToCompareIsProvided_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 0,
          remoteValueToCompare: 0,
          localValueToCompare: 1,
        ) {}
}

/* Exceptions on parameters */
class SmallerOrEqualToDouble_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(value: 1) {}
}
