import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _EqualToIntStub extends ValidatorStub<FormControl<int>, EqualToInt> {
  _EqualToIntStub({
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
    super.validator = EqualToInt(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class EqualToInt_ValueEqualsValueToCompare_Stub extends _EqualToIntStub {
  EqualToInt_ValueEqualsValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 0,
        ) {}
}

class EqualToInt_ValueAndValueToCompareAreNull_Stub extends _EqualToIntStub {
  EqualToInt_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class EqualToInt_ValueIsNull_Stub extends _EqualToIntStub {
  EqualToInt_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 0,
        ) {}
}

class EqualToInt_ValueToCompareIsNull_Stub extends _EqualToIntStub {
  EqualToInt_ValueToCompareIsNull_Stub()
      : super(
          value: 0,
          localValueToCompare: null,
        ) {}
}

class EqualToInt_ValueDoesNotEqualValueToCompare_Stub extends _EqualToIntStub {
  EqualToInt_ValueDoesNotEqualValueToCompare_Stub()
      : super(
          value: 1,
          localValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class EqualToInt_remoteValueToCompareIsProvided_Stub extends _EqualToIntStub {
  EqualToInt_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 1,
          remoteValueToCompare: 1,
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 0,
        ) {}
}

/* Exceptions on parameters */
