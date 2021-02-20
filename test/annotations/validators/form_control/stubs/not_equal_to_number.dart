import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _NotEqualToNumberStub
    extends ValidatorStub<FormControl<num>, NotEqualToNumber> {
  _NotEqualToNumberStub({
    num value,
    num remoteValueToCompare,
    String remoteValueToCompareName,
    num localValueToCompare,
  }) {
    FormControl<num> _value = new FormControl<num>(
      value: value,
      validators: [],
    );
    FormControl<num> _valueToCompare = new FormControl<num>(
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
    super.validator = NotEqualToNumber(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class NotEqualToNumber_ValueIsSmallerThanValueToCompare_Stub
    extends _NotEqualToNumberStub {
  NotEqualToNumber_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 1,
        ) {}
}

class NotEqualToNumber_ValueIsGreaterThanValueToCompare_Stub
    extends _NotEqualToNumberStub {
  NotEqualToNumber_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 1,
          localValueToCompare: 0,
        ) {}
}

class NotEqualToNumber_ValueAndValueToCompareAreNull_Stub
    extends _NotEqualToNumberStub {
  NotEqualToNumber_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class NotEqualToNumber_ValueIsNull_Stub extends _NotEqualToNumberStub {
  NotEqualToNumber_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 0,
        ) {}
}

class NotEqualToNumber_ValueToCompareIsNull_Stub extends _NotEqualToNumberStub {
  NotEqualToNumber_ValueToCompareIsNull_Stub()
      : super(
          value: 0,
          localValueToCompare: null,
        ) {}
}

class NotEqualToNumber_ValueIsEqualToValueToCompare_Stub
    extends _NotEqualToNumberStub {
  NotEqualToNumber_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class NotEqualToNumber_remoteValueToCompareIsProvided_Stub
    extends _NotEqualToNumberStub {
  NotEqualToNumber_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 1,
          remoteValueToCompare: 1,
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 0,
        ) {}
}

/* Exceptions */
