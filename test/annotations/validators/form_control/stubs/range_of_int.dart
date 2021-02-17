import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _RangeOfIntStub extends ValidatorStub<FormControl<int>, RangeOfInt> {
  _RangeOfIntStub({
    int fcValue,
    int fcMin,
    int fcMax,
    int validatorMin,
    int validatorMax,
  }) {
    FormControl<int> _value = new FormControl<int>(
      value: fcValue,
      validators: [],
    );
    FormControl<int> _min = new FormControl<int>(
      value: fcMin,
      validators: [],
    );
    FormControl<int> _max = new FormControl<int>(
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
    super.validator = RangeOfInt(
      min: validatorMin,
      max: validatorMax,
      minOnProperty: (fcMin != null) ? 'min' : null,
      maxOnProperty: (fcMax != null) ? 'max' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class RangeOfInt_ValueIsEqualToMin_Stub extends _RangeOfIntStub {
  RangeOfInt_ValueIsEqualToMin_Stub()
      : super(
          fcValue: 1,
          validatorMin: 1,
          validatorMax: 10,
        );
}

class RangeOfInt_ValueIsEqualToMax_Stub extends _RangeOfIntStub {
  RangeOfInt_ValueIsEqualToMax_Stub()
      : super(
          fcValue: 10,
          validatorMin: 1,
          validatorMax: 10,
        );
}

class RangeOfInt_ValueIsBetweenMinAndMax_Stub extends _RangeOfIntStub {
  RangeOfInt_ValueIsBetweenMinAndMax_Stub()
      : super(
          fcValue: 5,
          validatorMin: 1,
          validatorMax: 10,
        );
}

class RangeOfInt_ValueIsNull_Stub extends _RangeOfIntStub {
  RangeOfInt_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorMin: 1,
          validatorMax: 10,
        );
}

/* Value is not valid */
class RangeOfInt_ValueIsSmallerThanMin_Stub extends _RangeOfIntStub {
  RangeOfInt_ValueIsSmallerThanMin_Stub()
      : super(
          fcValue: -1,
          validatorMin: 1,
          validatorMax: 10,
        );
}

class RangeOfInt_ValueIsGreaterThanMax_Stub extends _RangeOfIntStub {
  RangeOfInt_ValueIsGreaterThanMax_Stub()
      : super(
          fcValue: 11,
          validatorMin: 1,
          validatorMax: 10,
        );
}

/* Remote parameters are provided */
class RangeOfInt_MinOnPropertyIsProvided_Stub extends _RangeOfIntStub {
  RangeOfInt_MinOnPropertyIsProvided_Stub()
      : super(
          fcValue: -5,
          fcMin: -5,
          validatorMin: 1,
          validatorMax: 10,
        );
}

class RangeOfInt_MaxOnPropertyIsProvided_Stub extends _RangeOfIntStub {
  RangeOfInt_MaxOnPropertyIsProvided_Stub()
      : super(
          fcValue: 15,
          fcMax: 15,
          validatorMin: 1,
          validatorMax: 10,
        );
}

/* Exceptions on parameters */
class RangeOfInt_ThrowsValidatorParameterExceptionOnNullMin_Stub
    extends _RangeOfIntStub {
  RangeOfInt_ThrowsValidatorParameterExceptionOnNullMin_Stub()
      : super(
          fcValue: 1,
          validatorMin: 1,
        );
}

class RangeOfInt_ThrowsValidatorParameterExceptionOnNullMax_Stub
    extends _RangeOfIntStub {
  RangeOfInt_ThrowsValidatorParameterExceptionOnNullMax_Stub()
      : super(
          fcValue: 1,
          validatorMax: 10,
        );
}
