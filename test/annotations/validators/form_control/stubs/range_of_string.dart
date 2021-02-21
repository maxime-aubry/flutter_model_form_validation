import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _RangeOfStringStub
    extends ValidatorStub<FormControl<String>, RangeOfString> {
  _RangeOfStringStub({
    String value,
    String remoteMin,
    String remoteMax,
    String remoteMinName,
    String remoteMaxName,
    String localMin,
    String localMax,
  }) {
    FormControl<String> _value = new FormControl<String>(
      value: value,
      validators: [],
    );
    FormControl<String> _min = new FormControl<String>(
      value: remoteMin,
      validators: [],
    );
    FormControl<String> _max = new FormControl<String>(
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
    super.validator = RangeOfString(
      min: localMin,
      max: localMax,
      remoteMin: remoteMinName,
      remoteMax: remoteMaxName,
      error: null,
    );
  }
}

/* Value is valid */
class RangeOfString_ValueIsEqualToMin_Stub extends _RangeOfStringStub {
  RangeOfString_ValueIsEqualToMin_Stub()
      : super(
          value: 'd',
          localMin: 'd',
          localMax: 'g',
        );
}

class RangeOfString_ValueIsEqualToMax_Stub extends _RangeOfStringStub {
  RangeOfString_ValueIsEqualToMax_Stub()
      : super(
          value: 'g',
          localMin: 'd',
          localMax: 'g',
        );
}

class RangeOfString_ValueIsBetweenMinAndMax_Stub extends _RangeOfStringStub {
  RangeOfString_ValueIsBetweenMinAndMax_Stub()
      : super(
          value: 'f',
          localMin: 'd',
          localMax: 'g',
        );
}

class RangeOfString_ValueIsNull_Stub extends _RangeOfStringStub {
  RangeOfString_ValueIsNull_Stub()
      : super(
          value: null,
          localMin: 'd',
          localMax: 'g',
        );
}

class RangeOfString_ValueIsEmpty_Stub extends _RangeOfStringStub {
  RangeOfString_ValueIsEmpty_Stub()
      : super(
          value: '',
          localMin: 'd',
          localMax: 'g',
        );
}

/* Value is not valid */
class RangeOfString_ValueIsSmallerThanMin_Stub extends _RangeOfStringStub {
  RangeOfString_ValueIsSmallerThanMin_Stub()
      : super(
          value: 'c',
          localMin: 'd',
          localMax: 'g',
        );
}

class RangeOfString_ValueIsGreaterThanMax_Stub extends _RangeOfStringStub {
  RangeOfString_ValueIsGreaterThanMax_Stub()
      : super(
          value: 'h',
          localMin: 'd',
          localMax: 'g',
        );
}

/* Remote parameters are provided */
class RangeOfString_remoteMinIsProvided_Stub extends _RangeOfStringStub {
  RangeOfString_remoteMinIsProvided_Stub()
      : super(
          value: 'b',
          remoteMin: 'b',
          remoteMinName: 'min',
          localMin: 'd',
          localMax: 'g',
        );
}

class RangeOfString_remoteMaxIsProvided_Stub extends _RangeOfStringStub {
  RangeOfString_remoteMaxIsProvided_Stub()
      : super(
          value: 'h',
          remoteMax: 'h',
          remoteMaxName: 'max',
          localMin: 'd',
          localMax: 'g',
        );
}

/* Exceptions */
class RangeOfString_ThrowsValidatorParameterExceptionOnNullMin_Stub
    extends _RangeOfStringStub {
  RangeOfString_ThrowsValidatorParameterExceptionOnNullMin_Stub()
      : super(
          value: 'd',
          localMax: 'd',
        );
}

class RangeOfString_ThrowsValidatorParameterExceptionOnNullMax_Stub
    extends _RangeOfStringStub {
  RangeOfString_ThrowsValidatorParameterExceptionOnNullMax_Stub()
      : super(
          value: 'h',
          localMin: 'h',
        );
}

class RangeOfString_ThrowsValidatorParameterExceptionOnMinIsGreaterThanMax_Stub
    extends _RangeOfStringStub {
  RangeOfString_ThrowsValidatorParameterExceptionOnMinIsGreaterThanMax_Stub()
      : super(
          value: 'a',
          localMin: 'd',
          localMax: 'a',
        );
}
