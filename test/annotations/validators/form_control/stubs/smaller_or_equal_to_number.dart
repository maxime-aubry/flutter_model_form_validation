import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';

class _SmallerOrEqualToNumberStub
    extends ValidatorStub<FormControl<num>, SmallerOrEqualToNumber> {
  _SmallerOrEqualToNumberStub({
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
    super.validator = SmallerOrEqualToNumber(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class SmallerOrEqualToNumber_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerOrEqualToNumberStub {
  SmallerOrEqualToNumber_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 1,
        ) {}
}

class SmallerOrEqualToNumber_ValueIsEqualToValueToCompare_Stub
    extends _SmallerOrEqualToNumberStub {
  SmallerOrEqualToNumber_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 1,
        ) {}
}

class SmallerOrEqualToNumber_ValueAndValueToCompareAreNull_Stub
    extends _SmallerOrEqualToNumberStub {
  SmallerOrEqualToNumber_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

class SmallerOrEqualToNumber_ValueIsNull_Stub
    extends _SmallerOrEqualToNumberStub {
  SmallerOrEqualToNumber_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 1,
        ) {}
}

class SmallerOrEqualToNumber_ValueToCompareIsNull_Stub
    extends _SmallerOrEqualToNumberStub {
  SmallerOrEqualToNumber_ValueToCompareIsNull_Stub()
      : super(
          value: 0,
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class SmallerOrEqualToNumber_ValueIsGreaterThanValueToCompare_Stub
    extends _SmallerOrEqualToNumberStub {
  SmallerOrEqualToNumber_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 2,
          localValueToCompare: 1,
        ) {}
}

/* Remote parameters are provided */
class SmallerOrEqualToNumber_remoteValueToCompareIsProvided_Stub
    extends _SmallerOrEqualToNumberStub {
  SmallerOrEqualToNumber_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 2,
          remoteValueToCompare: 2,
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 1,
        ) {}
}

/* Exceptions */
