import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';

class _GreaterThanNumberStub
    extends ValidatorStub<FormControl<num>, GreaterThanNumber> {
  _GreaterThanNumberStub({
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

    _value.parent = _root;
    _valueToCompare.parent = _root;

    super.control = _value;
    super.validator = GreaterThanNumber(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class GreaterThanNumber_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterThanNumberStub {
  GreaterThanNumber_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 1,
          localValueToCompare: 0,
        ) {}
}

class GreaterThanNumber_ValueAndValueToCompareAreNull_Stub
    extends _GreaterThanNumberStub {
  GreaterThanNumber_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

class GreaterThanNumber_ValueIsNull_Stub extends _GreaterThanNumberStub {
  GreaterThanNumber_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 1,
        ) {}
}

class GreaterThanNumber_ValueToCompareIsNull_Stub
    extends _GreaterThanNumberStub {
  GreaterThanNumber_ValueToCompareIsNull_Stub()
      : super(
          value: 1,
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class GreaterThanNumber_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterThanNumberStub {
  GreaterThanNumber_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: -1,
          localValueToCompare: 0,
        ) {}
}

class GreaterThanNumber_ValueIsEqualToValueToCompare_Stub
    extends _GreaterThanNumberStub {
  GreaterThanNumber_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class GreaterThanNumber_remoteValueToCompareIsProvided_Stub
    extends _GreaterThanNumberStub {
  GreaterThanNumber_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 2,
          remoteValueToCompare: 1,
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 10,
        ) {}
}

/* Exceptions */
