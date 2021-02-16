import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _RangeOfDoubleStub extends IStub<FormControl<double>, RangeOfDouble> {
  _RangeOfDoubleStub({
    double fcValue,
    double fcMin,
    double fcMax,
    double validatorMin,
    double validatorMax,
  }) {
    FormControl<double> _value = new FormControl<double>(
      value: fcValue,
      validators: [],
    );
    FormControl<double> _min = new FormControl<double>(
      value: fcMin,
      validators: [],
    );
    FormControl<double> _max = new FormControl<double>(
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
    super.validator = RangeOfDouble(
      min: validatorMin,
      max: validatorMax,
      minOnProperty: (fcMin != null) ? 'min' : null,
      maxOnProperty: (fcMax != null) ? 'max' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class RangeOfDouble_ValueIsEqualToMin_Stub extends _RangeOfDoubleStub {
  RangeOfDouble_ValueIsEqualToMin_Stub()
      : super(
          fcValue: 1,
          validatorMin: 1,
          validatorMax: 10,
        );
}

class RangeOfDouble_ValueIsEqualToMax_Stub extends _RangeOfDoubleStub {
  RangeOfDouble_ValueIsEqualToMax_Stub()
      : super(
          fcValue: 10,
          validatorMin: 1,
          validatorMax: 10,
        );
}

class RangeOfDouble_ValueIsBetweenMinAndMax_Stub extends _RangeOfDoubleStub {
  RangeOfDouble_ValueIsBetweenMinAndMax_Stub()
      : super(
          fcValue: 5,
          validatorMin: 1,
          validatorMax: 10,
        );
}

class RangeOfDouble_ValueIsNull_Stub extends _RangeOfDoubleStub {
  RangeOfDouble_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorMin: 1,
          validatorMax: 10,
        );
}

/* Value is not valid */
class RangeOfDouble_ValueIsSmallerThanMin_Stub extends _RangeOfDoubleStub {
  RangeOfDouble_ValueIsSmallerThanMin_Stub()
      : super(
          fcValue: -1,
          validatorMin: 1,
          validatorMax: 10,
        );
}

class RangeOfDouble_ValueIsGreaterThanMax_Stub extends _RangeOfDoubleStub {
  RangeOfDouble_ValueIsGreaterThanMax_Stub()
      : super(
          fcValue: 11,
          validatorMin: 1,
          validatorMax: 10,
        );
}

/* Remote parameters are provided */
class RangeOfDouble_MinOnPropertyIsProvided_Stub extends _RangeOfDoubleStub {
  RangeOfDouble_MinOnPropertyIsProvided_Stub()
      : super(
          fcValue: -5,
          fcMin: -5,
          validatorMin: 1,
          validatorMax: 10,
        );
}

class RangeOfDouble_MaxOnPropertyIsProvided_Stub extends _RangeOfDoubleStub {
  RangeOfDouble_MaxOnPropertyIsProvided_Stub()
      : super(
          fcValue: 15,
          fcMax: 15,
          validatorMin: 1,
          validatorMax: 10,
        );
}

/* None parameter is provided */
class RangeOfDouble_ThrowsValidatorParameterExceptionOnNullMin_Stub
    extends _RangeOfDoubleStub {
  RangeOfDouble_ThrowsValidatorParameterExceptionOnNullMin_Stub()
      : super(
          fcValue: 1,
          validatorMin: 1,
        );
}

class RangeOfDouble_ThrowsValidatorParameterExceptionOnNullMax_Stub
    extends _RangeOfDoubleStub {
  RangeOfDouble_ThrowsValidatorParameterExceptionOnNullMax_Stub()
      : super(
          fcValue: 1,
          validatorMax: 10,
        );
}
