import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../../../stubs.dart';

class _RangeOfIntStub extends ValidatorStub<FormControl<int>, RangeOfInt> {
  _RangeOfIntStub({
    int value,
    int remoteMin,
    int remoteMax,
    String remoteMinName,
    String remoteMaxName,
    int localMin,
    int localMax,
  }) {
    FormControl<int> _value = new FormControl<int>(
      value: value,
      validators: [],
    );
    FormControl<int> _min = new FormControl<int>(
      value: remoteMin,
      validators: [],
    );
    FormControl<int> _max = new FormControl<int>(
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
    super.validator = RangeOfInt(
      min: localMin,
      max: localMax,
      remoteMin: remoteMinName,
      remoteMax: remoteMaxName,
      error: null,
    );
  }
}

/* Value is valid */
class RangeOfInt_ValueIsEqualToMin_Stub extends _RangeOfIntStub {
  RangeOfInt_ValueIsEqualToMin_Stub()
      : super(
          value: 1,
          localMin: 1,
          localMax: 10,
        );
}

class RangeOfInt_ValueIsEqualToMax_Stub extends _RangeOfIntStub {
  RangeOfInt_ValueIsEqualToMax_Stub()
      : super(
          value: 10,
          localMin: 1,
          localMax: 10,
        );
}

class RangeOfInt_ValueIsBetweenMinAndMax_Stub extends _RangeOfIntStub {
  RangeOfInt_ValueIsBetweenMinAndMax_Stub()
      : super(
          value: 5,
          localMin: 1,
          localMax: 10,
        );
}

class RangeOfInt_ValueIsNull_Stub extends _RangeOfIntStub {
  RangeOfInt_ValueIsNull_Stub()
      : super(
          value: null,
          localMin: 1,
          localMax: 10,
        );
}

/* Value is not valid */
class RangeOfInt_ValueIsSmallerThanMin_Stub extends _RangeOfIntStub {
  RangeOfInt_ValueIsSmallerThanMin_Stub()
      : super(
          value: -1,
          localMin: 1,
          localMax: 10,
        );
}

class RangeOfInt_ValueIsGreaterThanMax_Stub extends _RangeOfIntStub {
  RangeOfInt_ValueIsGreaterThanMax_Stub()
      : super(
          value: 11,
          localMin: 1,
          localMax: 10,
        );
}

/* Remote parameters are provided */
class RangeOfInt_remoteMinIsProvided_Stub extends _RangeOfIntStub {
  RangeOfInt_remoteMinIsProvided_Stub()
      : super(
          value: -5,
          remoteMin: -5,
          remoteMinName: 'min',
          localMin: 1,
          localMax: 10,
        );
}

class RangeOfInt_remoteMaxIsProvided_Stub extends _RangeOfIntStub {
  RangeOfInt_remoteMaxIsProvided_Stub()
      : super(
          value: 15,
          remoteMax: 15,
          remoteMaxName: 'max',
          localMin: 1,
          localMax: 10,
        );
}

/* Exceptions */
class RangeOfInt_ThrowsValidatorParameterExceptionOnNullMin_Stub
    extends _RangeOfIntStub {
  RangeOfInt_ThrowsValidatorParameterExceptionOnNullMin_Stub()
      : super(
          value: 1,
          localMax: 1,
        );
}

class RangeOfInt_ThrowsValidatorParameterExceptionOnNullMax_Stub
    extends _RangeOfIntStub {
  RangeOfInt_ThrowsValidatorParameterExceptionOnNullMax_Stub()
      : super(
          value: 1,
          localMin: 10,
        );
}

class RangeOfInt_ThrowsValidatorParameterExceptionOnMinIsGreaterThanMax_Stub
    extends _RangeOfIntStub {
  RangeOfInt_ThrowsValidatorParameterExceptionOnMinIsGreaterThanMax_Stub()
      : super(
          value: 1,
          localMin: 10,
          localMax: 1,
        );
}
