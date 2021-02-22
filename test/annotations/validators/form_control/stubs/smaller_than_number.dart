import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';

class _SmallerThanNumberStub
    extends ValidatorStub<FormControl<num>, SmallerThanNumber> {
  _SmallerThanNumberStub({
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
    super.validator = SmallerThanNumber(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class SmallerThanNumber_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerThanNumberStub {
  SmallerThanNumber_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 1,
        ) {}
}

class SmallerThanNumber_ValueAndValueToCompareAreNull_Stub
    extends _SmallerThanNumberStub {
  SmallerThanNumber_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

class SmallerThanNumber_ValueIsNull_Stub extends _SmallerThanNumberStub {
  SmallerThanNumber_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 0,
        ) {}
}

class SmallerThanNumber_ValueToCompareIsNull_Stub
    extends _SmallerThanNumberStub {
  SmallerThanNumber_ValueToCompareIsNull_Stub()
      : super(
          value: 0,
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class SmallerThanNumber_ValueIsGreaterThanValueToCompare_Stub
    extends _SmallerThanNumberStub {
  SmallerThanNumber_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 1,
          localValueToCompare: 0,
        ) {}
}

class SmallerThanNumber_ValueIsEqualToValueToCompare_Stub
    extends _SmallerThanNumberStub {
  SmallerThanNumber_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class SmallerThanNumber_remoteValueToCompareIsProvided_Stub
    extends _SmallerThanNumberStub {
  SmallerThanNumber_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 4,
          remoteValueToCompare: 5,
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 2,
        ) {}
}

/* Exceptions */
