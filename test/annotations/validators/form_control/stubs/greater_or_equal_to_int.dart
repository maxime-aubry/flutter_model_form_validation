import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _GreaterOrEqualToIntStub
    extends ValidatorStub<FormControl<int>, GreaterOrEqualToInt> {
  _GreaterOrEqualToIntStub({
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
    super.validator = GreaterOrEqualToInt(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class GreaterOrEqualToInt_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterOrEqualToIntStub {
  GreaterOrEqualToInt_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 1,
          localValueToCompare: 0,
        ) {}
}

class GreaterOrEqualToInt_ValueIsEqualToValueToCompare_Stub
    extends _GreaterOrEqualToIntStub {
  GreaterOrEqualToInt_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 0,
        ) {}
}

class GreaterOrEqualToInt_ValueAndValueToCompareAreNull_Stub
    extends _GreaterOrEqualToIntStub {
  GreaterOrEqualToInt_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class GreaterOrEqualToInt_ValueIsNull_Stub extends _GreaterOrEqualToIntStub {
  GreaterOrEqualToInt_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 0,
        ) {}
}

class GreaterOrEqualToInt_ValueToCompareIsNull_Stub
    extends _GreaterOrEqualToIntStub {
  GreaterOrEqualToInt_ValueToCompareIsNull_Stub()
      : super(
          value: 0,
          localValueToCompare: null,
        ) {}
}

class GreaterOrEqualToInt_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterOrEqualToIntStub {
  GreaterOrEqualToInt_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 1,
        ) {}
}

/* Remote parameters are provided */
class GreaterOrEqualToInt_remoteValueToCompareIsProvided_Stub
    extends _GreaterOrEqualToIntStub {
  GreaterOrEqualToInt_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 1,
          remoteValueToCompare: 1,
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 0,
        ) {}
}

/* Exceptions */
