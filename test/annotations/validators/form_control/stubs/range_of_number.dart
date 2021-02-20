import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _RangeOfNumberStub
    extends ValidatorStub<FormControl<num>, RangeOfNumber> {
  _RangeOfNumberStub({
    num value,
    num remoteMin,
    num remoteMax,
    String remoteMinName,
    String remoteMaxName,
    num localMin,
    num localMax,
  }) {
    FormControl<num> _value = new FormControl<num>(
      value: value,
      validators: [],
    );
    FormControl<num> _min = new FormControl<num>(
      value: remoteMin,
      validators: [],
    );
    FormControl<num> _max = new FormControl<num>(
      value: remoteMax,
      validators: [],
    );

    Map<String, AbstractControl> controls = {'value': _value};
    if (remoteMinName != null) controls[remoteMinName] = _min;
    if (remoteMaxName != null) controls[remoteMaxName] = _max;

    FormGroup _root = new FormGroup(
      controls: controls,
      validators: [],
    );

    _value.parentGroup = _root;
    _min.parentGroup = _root;
    _max.parentGroup = _root;

    super.control = _value;
    super.validator = RangeOfNumber(
      min: localMin,
      max: localMax,
      remoteMin: remoteMinName,
      remoteMax: remoteMaxName,
      error: null,
    );
  }
}

/* Value is valid */
class RangeOfNumber_ValueIsEqualToMin_Stub extends _RangeOfNumberStub {
  RangeOfNumber_ValueIsEqualToMin_Stub()
      : super(
          value: 1,
          localMin: 1,
          localMax: 10,
        );
}

class RangeOfNumber_ValueIsEqualToMax_Stub extends _RangeOfNumberStub {
  RangeOfNumber_ValueIsEqualToMax_Stub()
      : super(
          value: 10,
          localMin: 1,
          localMax: 10,
        );
}

class RangeOfNumber_ValueIsBetweenMinAndMax_Stub extends _RangeOfNumberStub {
  RangeOfNumber_ValueIsBetweenMinAndMax_Stub()
      : super(
          value: 5,
          localMin: 1,
          localMax: 10,
        );
}

class RangeOfNumber_ValueIsNull_Stub extends _RangeOfNumberStub {
  RangeOfNumber_ValueIsNull_Stub()
      : super(
          value: null,
          localMin: 1,
          localMax: 10,
        );
}

/* Value is not valid */
class RangeOfNumber_ValueIsSmallerThanMin_Stub extends _RangeOfNumberStub {
  RangeOfNumber_ValueIsSmallerThanMin_Stub()
      : super(
          value: -1,
          localMin: 1,
          localMax: 10,
        );
}

class RangeOfNumber_ValueIsGreaterThanMax_Stub extends _RangeOfNumberStub {
  RangeOfNumber_ValueIsGreaterThanMax_Stub()
      : super(
          value: 11,
          localMin: 1,
          localMax: 10,
        );
}

/* Remote parameters are provided */
class RangeOfNumber_remoteMinIsProvided_Stub extends _RangeOfNumberStub {
  RangeOfNumber_remoteMinIsProvided_Stub()
      : super(
          value: -5,
          remoteMin: -5,
          localMin: 1,
          localMax: 10,
        );
}

class RangeOfNumber_remoteMaxIsProvided_Stub extends _RangeOfNumberStub {
  RangeOfNumber_remoteMaxIsProvided_Stub()
      : super(
          value: 15,
          remoteMax: 15,
          localMin: 1,
          localMax: 10,
        );
}

/* Exceptions */
class RangeOfNumber_ThrowsValidatorParameterExceptionOnNullMin_Stub
    extends _RangeOfNumberStub {
  RangeOfNumber_ThrowsValidatorParameterExceptionOnNullMin_Stub()
      : super(
          value: 1,
          localMin: 1,
        );
}

class RangeOfNumber_ThrowsValidatorParameterExceptionOnNullMax_Stub
    extends _RangeOfNumberStub {
  RangeOfNumber_ThrowsValidatorParameterExceptionOnNullMax_Stub()
      : super(
          value: 1,
          localMax: 10,
        );
}
