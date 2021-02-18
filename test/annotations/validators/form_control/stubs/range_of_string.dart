import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _RangeOfStringStub
    extends ValidatorStub<FormControl<String>, RangeOfString> {
  _RangeOfStringStub({
    String fcValue,
    String fcMin,
    String fcMax,
    String validatorMin,
    String validatorMax,
  }) {
    FormControl<String> _value = new FormControl<String>(
      value: fcValue,
      validators: [],
    );
    FormControl<String> _min = new FormControl<String>(
      value: fcMin,
      validators: [],
    );
    FormControl<String> _max = new FormControl<String>(
      value: fcMax,
      validators: [],
    );
    FormGroup _root = new FormGroup(
      controls: {
        'value': _value,
        'min': _min,
        'max': _max,
      },
      validators: [],
    );
    _value.parentGroup = _root;
    _min.parentGroup = _root;
    _max.parentGroup = _root;

    super.control = _value;
    super.validator = RangeOfString(
      min: validatorMin,
      max: validatorMax,
      remoteMin: (fcMin != null) ? 'min' : null,
      remoteMax: (fcMax != null) ? 'max' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class RangeOfString_ValueIsEqualToMin_Stub extends _RangeOfStringStub {
  RangeOfString_ValueIsEqualToMin_Stub()
      : super(
          fcValue: 'd',
          validatorMin: 'd',
          validatorMax: 'g',
        );
}

class RangeOfString_ValueIsEqualToMax_Stub extends _RangeOfStringStub {
  RangeOfString_ValueIsEqualToMax_Stub()
      : super(
          fcValue: 'g',
          validatorMin: 'd',
          validatorMax: 'g',
        );
}

class RangeOfString_ValueIsBetweenMinAndMax_Stub extends _RangeOfStringStub {
  RangeOfString_ValueIsBetweenMinAndMax_Stub()
      : super(
          fcValue: 'f',
          validatorMin: 'd',
          validatorMax: 'g',
        );
}

class RangeOfString_ValueIsNull_Stub extends _RangeOfStringStub {
  RangeOfString_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorMin: 'd',
          validatorMax: 'g',
        );
}

class RangeOfString_ValueIsEmpty_Stub extends _RangeOfStringStub {
  RangeOfString_ValueIsEmpty_Stub()
      : super(
          fcValue: '',
          validatorMin: 'd',
          validatorMax: 'g',
        );
}

/* Value is not valid */
class RangeOfString_ValueIsSmallerThanMin_Stub extends _RangeOfStringStub {
  RangeOfString_ValueIsSmallerThanMin_Stub()
      : super(
          fcValue: 'c',
          validatorMin: 'd',
          validatorMax: 'g',
        );
}

class RangeOfString_ValueIsGreaterThanMax_Stub extends _RangeOfStringStub {
  RangeOfString_ValueIsGreaterThanMax_Stub()
      : super(
          fcValue: 'h',
          validatorMin: 'd',
          validatorMax: 'g',
        );
}

/* Remote parameters are provided */
class RangeOfString_remoteMinIsProvided_Stub extends _RangeOfStringStub {
  RangeOfString_remoteMinIsProvided_Stub()
      : super(
          fcValue: 'b',
          fcMin: 'b',
          validatorMin: 'd',
          validatorMax: 'g',
        );
}

class RangeOfString_remoteMaxIsProvided_Stub extends _RangeOfStringStub {
  RangeOfString_remoteMaxIsProvided_Stub()
      : super(
          fcValue: 'h',
          fcMax: 'h',
          validatorMin: 'd',
          validatorMax: 'g',
        );
}

/* Exceptions on parameters */
class RangeOfString_ThrowsValidatorParameterExceptionOnNullMin_Stub
    extends _RangeOfStringStub {
  RangeOfString_ThrowsValidatorParameterExceptionOnNullMin_Stub()
      : super(
          fcValue: 'd',
          validatorMin: 'd',
        );
}

class RangeOfString_ThrowsValidatorParameterExceptionOnNullMax_Stub
    extends _RangeOfStringStub {
  RangeOfString_ThrowsValidatorParameterExceptionOnNullMax_Stub()
      : super(
          fcValue: 'h',
          validatorMax: 'h',
        );
}
