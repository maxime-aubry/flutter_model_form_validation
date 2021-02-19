import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _SmallerThanIntStub
    extends ValidatorStub<FormControl<int>, SmallerThanInt> {
  _SmallerThanIntStub({
    int value,
    int remoteValueToCompare,
    String remoteValueToCompareName,
    int localValueToCompare,
  }) {
    FormControl<int> _value = new FormControl<int>(
      value: value,
      validators: [],
    );
    FormControl<int> _valueToCompare = new FormControl<int>(
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
    super.validator = SmallerThanInt(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class SmallerThanInt_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerThanIntStub {
  SmallerThanInt_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 1,
        ) {}
}

class SmallerThanInt_ValueIsNull_Stub extends _SmallerThanIntStub {
  SmallerThanInt_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class SmallerThanInt_ValueIsGreaterThanValueToCompare_Stub
    extends _SmallerThanIntStub {
  SmallerThanInt_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 1,
          localValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class SmallerThanInt_remoteValueToCompareIsProvided_Stub
    extends _SmallerThanIntStub {
  SmallerThanInt_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 0,
          remoteValueToCompare: 0,
          localValueToCompare: 1,
        ) {}
}

/* Exceptions on parameters */
class SmallerThanInt_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _SmallerThanIntStub {
  SmallerThanInt_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(value: 1) {}
}
