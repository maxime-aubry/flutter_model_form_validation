import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';

class _RangeOfDoubleStub
    extends ValidatorStub<FormControl<double>, RangeOfDouble> {
  _RangeOfDoubleStub({
    double value,
    double remoteMin,
    double remoteMax,
    String remoteMinName,
    String remoteMaxName,
    double localMin,
    double localMax,
  }) {
    FormControl<double> _value = new FormControl<double>(
      value: value,
      validators: [],
    );
    FormControl<double> _min = new FormControl<double>(
      value: remoteMin,
      validators: [],
    );
    FormControl<double> _max = new FormControl<double>(
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
    super.validator = RangeOfDouble(
      min: localMin,
      max: localMax,
      remoteMin: remoteMinName,
      remoteMax: remoteMaxName,
      error: null,
    );
  }
}

/* Value is valid */
class RangeOfDouble_ValueIsEqualToMin_Stub extends _RangeOfDoubleStub {
  RangeOfDouble_ValueIsEqualToMin_Stub()
      : super(
          value: 1,
          localMin: 1,
          localMax: 10,
        );
}

class RangeOfDouble_ValueIsEqualToMax_Stub extends _RangeOfDoubleStub {
  RangeOfDouble_ValueIsEqualToMax_Stub()
      : super(
          value: 10,
          localMin: 1,
          localMax: 10,
        );
}

class RangeOfDouble_ValueIsBetweenMinAndMax_Stub extends _RangeOfDoubleStub {
  RangeOfDouble_ValueIsBetweenMinAndMax_Stub()
      : super(
          value: 5,
          localMin: 1,
          localMax: 10,
        );
}

class RangeOfDouble_ValueIsNull_Stub extends _RangeOfDoubleStub {
  RangeOfDouble_ValueIsNull_Stub()
      : super(
          value: null,
          localMin: 1,
          localMax: 10,
        );
}

/* Value is not valid */
class RangeOfDouble_ValueIsSmallerThanMin_Stub extends _RangeOfDoubleStub {
  RangeOfDouble_ValueIsSmallerThanMin_Stub()
      : super(
          value: -1,
          localMin: 1,
          localMax: 10,
        );
}

class RangeOfDouble_ValueIsGreaterThanMax_Stub extends _RangeOfDoubleStub {
  RangeOfDouble_ValueIsGreaterThanMax_Stub()
      : super(
          value: 11,
          localMin: 1,
          localMax: 10,
        );
}

/* Remote parameters are provided */
class RangeOfDouble_remoteMinIsProvided_Stub extends _RangeOfDoubleStub {
  RangeOfDouble_remoteMinIsProvided_Stub()
      : super(
          value: -5,
          remoteMin: -5,
          remoteMinName: 'min',
          localMin: 1,
          localMax: 10,
        );
}

class RangeOfDouble_remoteMaxIsProvided_Stub extends _RangeOfDoubleStub {
  RangeOfDouble_remoteMaxIsProvided_Stub()
      : super(
          value: 15,
          remoteMax: 15,
          remoteMaxName: 'min',
          localMin: 1,
          localMax: 10,
        );
}

/* Exceptions */
class RangeOfDouble_ThrowsValidatorParameterExceptionOnNullMin_Stub
    extends _RangeOfDoubleStub {
  RangeOfDouble_ThrowsValidatorParameterExceptionOnNullMin_Stub()
      : super(
          value: 1,
          localMax: 1,
        );
}

class RangeOfDouble_ThrowsValidatorParameterExceptionOnNullMax_Stub
    extends _RangeOfDoubleStub {
  RangeOfDouble_ThrowsValidatorParameterExceptionOnNullMax_Stub()
      : super(
          value: 1,
          localMin: 10,
        );
}

class RangeOfDouble_ThrowsValidatorParameterExceptionOnMinIsGreaterThanMax_Stub
    extends _RangeOfDoubleStub {
  RangeOfDouble_ThrowsValidatorParameterExceptionOnMinIsGreaterThanMax_Stub()
      : super(
          value: 1,
          localMin: 10,
          localMax: 1,
        );
}
