import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _NotEqualToIntStub
    extends ValidatorStub<FormControl<int>, NotEqualToInt> {
  _NotEqualToIntStub({
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
    super.validator = NotEqualToInt(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class NotEqualToInt_ValueIsSmallerThanValueToCompare_Stub
    extends _NotEqualToIntStub {
  NotEqualToInt_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 1,
        ) {}
}

class NotEqualToInt_ValueIsGreaterThanValueToCompare_Stub
    extends _NotEqualToIntStub {
  NotEqualToInt_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 1,
          localValueToCompare: 0,
        ) {}
}

class NotEqualToInt_ValueAndValueToCompareAreNull_Stub
    extends _NotEqualToIntStub {
  NotEqualToInt_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class NotEqualToInt_ValueIsNull_Stub extends _NotEqualToIntStub {
  NotEqualToInt_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 0,
        ) {}
}

class NotEqualToInt_ValueToCompareIsNull_Stub extends _NotEqualToIntStub {
  NotEqualToInt_ValueToCompareIsNull_Stub()
      : super(
          value: 0,
          localValueToCompare: null,
        ) {}
}

class NotEqualToInt_ValueIsEqualToValueToCompare_Stub
    extends _NotEqualToIntStub {
  NotEqualToInt_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class NotEqualToInt_remoteValueToCompareIsProvided_Stub
    extends _NotEqualToIntStub {
  NotEqualToInt_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 0,
          remoteValueToCompare: 1,
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 0,
        ) {}
}

/* Exceptions */
