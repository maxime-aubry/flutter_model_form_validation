import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

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

class SmallerThanNumber_ValueIsNull_Stub extends _SmallerThanNumberStub {
  SmallerThanNumber_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 0,
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

/* Remote parameters are provided */
class SmallerThanNumber_remoteValueToCompareIsProvided_Stub
    extends _SmallerThanNumberStub {
  SmallerThanNumber_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 0,
          remoteValueToCompare: 0,
          localValueToCompare: 1,
        ) {}
}

/* Exceptions */
class SmallerThanNumber_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _SmallerThanNumberStub {
  SmallerThanNumber_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(value: 1) {}
}
