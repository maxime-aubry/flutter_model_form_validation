import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _RangeOfNumberStub extends IStub<FormControl<num>, RangeOfNumber> {
  _RangeOfNumberStub({
    num fcValue,
    num fcMin,
    num fcMax,
    num validatorMin,
    num validatorMax,
  }) {
    FormControl<num> _value = new FormControl<num>(
      value: fcValue,
      validators: [],
    );
    FormControl<num> _min = new FormControl<num>(
      value: fcMin,
      validators: [],
    );
    FormControl<num> _max = new FormControl<num>(
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
    super.validator = RangeOfNumber(
      min: validatorMin,
      max: validatorMax,
      minOnProperty: (fcMin != null) ? 'min' : null,
      maxOnProperty: (fcMax != null) ? 'max' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class RangeOfNumber_ValueIsEqualToMin_Stub extends _RangeOfNumberStub {
  RangeOfNumber_ValueIsEqualToMin_Stub()
      : super(
          fcValue: 1,
          validatorMin: 1,
          validatorMax: 10,
        );
}

class RangeOfNumber_ValueIsEqualToMax_Stub extends _RangeOfNumberStub {
  RangeOfNumber_ValueIsEqualToMax_Stub()
      : super(
          fcValue: 10,
          validatorMin: 1,
          validatorMax: 10,
        );
}

class RangeOfNumber_ValueIsBetweenMinAndMax_Stub extends _RangeOfNumberStub {
  RangeOfNumber_ValueIsBetweenMinAndMax_Stub()
      : super(
          fcValue: 5,
          validatorMin: 1,
          validatorMax: 10,
        );
}

class RangeOfNumber_ValueIsNull_Stub extends _RangeOfNumberStub {
  RangeOfNumber_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorMin: 1,
          validatorMax: 10,
        );
}

/* Value is not valid */
class RangeOfNumber_ValueIsSmallerThanMin_Stub extends _RangeOfNumberStub {
  RangeOfNumber_ValueIsSmallerThanMin_Stub()
      : super(
          fcValue: -1,
          validatorMin: 1,
          validatorMax: 10,
        );
}

class RangeOfNumber_ValueIsGreaterThanMax_Stub extends _RangeOfNumberStub {
  RangeOfNumber_ValueIsGreaterThanMax_Stub()
      : super(
          fcValue: 11,
          validatorMin: 1,
          validatorMax: 10,
        );
}

/* Remote parameters are provided */
class RangeOfNumber_MinOnPropertyIsProvided_Stub extends _RangeOfNumberStub {
  RangeOfNumber_MinOnPropertyIsProvided_Stub()
      : super(
          fcValue: -5,
          fcMin: -5,
          validatorMin: 1,
          validatorMax: 10,
        );
}

class RangeOfNumber_MaxOnPropertyIsProvided_Stub extends _RangeOfNumberStub {
  RangeOfNumber_MaxOnPropertyIsProvided_Stub()
      : super(
          fcValue: 15,
          fcMax: 15,
          validatorMin: 1,
          validatorMax: 10,
        );
}

/* None parameter is provided */
class RangeOfNumber_ThrowsValidatorParameterExceptionOnNullMin_Stub
    extends _RangeOfNumberStub {
  RangeOfNumber_ThrowsValidatorParameterExceptionOnNullMin_Stub()
      : super(
          fcValue: 1,
          validatorMin: 1,
        );
}

class RangeOfNumber_ThrowsValidatorParameterExceptionOnNullMax_Stub
    extends _RangeOfNumberStub {
  RangeOfNumber_ThrowsValidatorParameterExceptionOnNullMax_Stub()
      : super(
          fcValue: 1,
          validatorMax: 10,
        );
}
