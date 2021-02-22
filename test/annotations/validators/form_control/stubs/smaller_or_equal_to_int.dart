import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _SmallerOrEqualToIntStub
    extends ValidatorStub<FormControl<int>, SmallerOrEqualToInt> {
  _SmallerOrEqualToIntStub({
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
    super.validator = SmallerOrEqualToInt(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class SmallerOrEqualToInt_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerOrEqualToIntStub {
  SmallerOrEqualToInt_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 1,
        ) {}
}

class SmallerOrEqualToInt_ValueIsEqualToValueToCompare_Stub
    extends _SmallerOrEqualToIntStub {
  SmallerOrEqualToInt_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 1,
        ) {}
}

class SmallerOrEqualToInt_ValueAndValueToCompareAreNull_Stub
    extends _SmallerOrEqualToIntStub {
  SmallerOrEqualToInt_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class SmallerOrEqualToInt_ValueIsNull_Stub extends _SmallerOrEqualToIntStub {
  SmallerOrEqualToInt_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 1,
        ) {}
}

class SmallerOrEqualToInt_ValueToCompareIsNull_Stub
    extends _SmallerOrEqualToIntStub {
  SmallerOrEqualToInt_ValueToCompareIsNull_Stub()
      : super(
          value: 0,
          localValueToCompare: null,
        ) {}
}

class SmallerOrEqualToInt_ValueIsGreaterThanValueToCompare_Stub
    extends _SmallerOrEqualToIntStub {
  SmallerOrEqualToInt_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 2,
          localValueToCompare: 1,
        ) {}
}

/* Remote parameters are provided */
class SmallerOrEqualToInt_remoteValueToCompareIsProvided_Stub
    extends _SmallerOrEqualToIntStub {
  SmallerOrEqualToInt_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 2,
          remoteValueToCompare: 2,
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 1,
        ) {}
}

/* Exceptions */
