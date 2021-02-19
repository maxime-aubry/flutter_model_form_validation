import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

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

    _value.parentGroup = _root;
    _valueToCompare.parentGroup = _root;

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

class GreaterThanNumber_ValueIsNull_Stub extends _GreaterThanNumberStub {
  GreaterThanNumber_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 0,
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

class GreaterThanNumber_ValueEqualsValueToCompare_Stub
    extends _GreaterThanNumberStub {
  GreaterThanNumber_ValueEqualsValueToCompare_Stub()
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
          value: 1,
          remoteValueToCompare: 1,
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 0,
        ) {}
}

/* Exceptions on parameters */
