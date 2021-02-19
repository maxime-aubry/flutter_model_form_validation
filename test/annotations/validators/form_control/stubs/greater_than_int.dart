import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _GreaterThanIntStub
    extends ValidatorStub<FormControl<int>, GreaterThanInt> {
  _GreaterThanIntStub({
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
    super.validator = GreaterThanInt(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class GreaterThanInt_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterThanIntStub {
  GreaterThanInt_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 1,
          localValueToCompare: 0,
        ) {}
}

class GreaterThanInt_ValueIsNull_Stub extends _GreaterThanIntStub {
  GreaterThanInt_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class GreaterThanInt_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterThanIntStub {
  GreaterThanInt_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: -1,
          localValueToCompare: 0,
        ) {}
}

class GreaterThanInt_ValueEqualsValueToCompare_Stub
    extends _GreaterThanIntStub {
  GreaterThanInt_ValueEqualsValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class GreaterThanInt_remoteValueToCompareIsProvided_Stub
    extends _GreaterThanIntStub {
  GreaterThanInt_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 1,
          remoteValueToCompare: 1,
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 0,
        ) {}
}

/* Exceptions on parameters */
