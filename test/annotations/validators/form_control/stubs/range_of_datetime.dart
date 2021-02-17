import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _RangeOfDateTimeStub
    extends ValidatorStub<FormControl<DateTime>, RangeOfDateTime> {
  _RangeOfDateTimeStub({
    DateTime fcValue,
    DateTime fcMin,
    DateTime fcMax,
    ConstantDateTime validatorMin,
    ConstantDateTime validatorMax,
  }) {
    FormControl<DateTime> _value = new FormControl<DateTime>(
      value: fcValue,
      validators: [],
    );
    FormControl<DateTime> _min = new FormControl<DateTime>(
      value: fcMin,
      validators: [],
    );
    FormControl<DateTime> _max = new FormControl<DateTime>(
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
    super.validator = RangeOfDateTime(
      min: validatorMin,
      max: validatorMax,
      minOnProperty: (fcMin != null) ? 'min' : null,
      maxOnProperty: (fcMax != null) ? 'max' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class RangeOfDateTime_ValueIsEqualToMin_Stub extends _RangeOfDateTimeStub {
  RangeOfDateTime_ValueIsEqualToMin_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 1),
          validatorMin: const ConstantDateTime('2021-01-01T00:00:00'),
          validatorMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}

class RangeOfDateTime_ValueIsEqualToMax_Stub extends _RangeOfDateTimeStub {
  RangeOfDateTime_ValueIsEqualToMax_Stub()
      : super(
          fcValue: new DateTime(2021, 12, 31),
          validatorMin: const ConstantDateTime('2021-01-01T00:00:00'),
          validatorMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}

class RangeOfDateTime_ValueIsBetweenMinAndMax_Stub
    extends _RangeOfDateTimeStub {
  RangeOfDateTime_ValueIsBetweenMinAndMax_Stub()
      : super(
          fcValue: new DateTime(2021, 6, 1),
          validatorMin: const ConstantDateTime('2021-01-01T00:00:00'),
          validatorMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}

class RangeOfDateTime_ValueIsNull_Stub extends _RangeOfDateTimeStub {
  RangeOfDateTime_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorMin: const ConstantDateTime('2021-01-01T00:00:00'),
          validatorMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}

/* Value is not valid */
class RangeOfDateTime_ValueIsSmallerThanMin_Stub extends _RangeOfDateTimeStub {
  RangeOfDateTime_ValueIsSmallerThanMin_Stub()
      : super(
          fcValue: new DateTime(2020, 12, 31),
          validatorMin: const ConstantDateTime('2021-01-01T00:00:00'),
          validatorMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}

class RangeOfDateTime_ValueIsGreaterThanMax_Stub extends _RangeOfDateTimeStub {
  RangeOfDateTime_ValueIsGreaterThanMax_Stub()
      : super(
          fcValue: new DateTime(2022, 1, 1),
          validatorMin: const ConstantDateTime('2021-01-01T00:00:00'),
          validatorMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}

/* Remote parameters are provided */
class RangeOfDateTime_MinOnPropertyIsProvided_Stub
    extends _RangeOfDateTimeStub {
  RangeOfDateTime_MinOnPropertyIsProvided_Stub()
      : super(
          fcValue: new DateTime(2020, 6, 1),
          fcMin: new DateTime(2020, 1, 1),
          validatorMin: const ConstantDateTime('2021-01-01T00:00:00'),
          validatorMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}

class RangeOfDateTime_MaxOnPropertyIsProvided_Stub
    extends _RangeOfDateTimeStub {
  RangeOfDateTime_MaxOnPropertyIsProvided_Stub()
      : super(
          fcValue: new DateTime(2022, 6, 1),
          fcMax: new DateTime(2022, 12, 31),
          validatorMin: const ConstantDateTime('2021-01-01T00:00:00'),
          validatorMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}

/* Exceptions on parameters */
class RangeOfDateTime_ThrowsValidatorParameterExceptionOnNullMin_Stub
    extends _RangeOfDateTimeStub {
  RangeOfDateTime_ThrowsValidatorParameterExceptionOnNullMin_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 1),
          validatorMin: const ConstantDateTime('2021-01-01T00:00:00'),
        );
}

class RangeOfDateTime_ThrowsValidatorParameterExceptionOnNullMax_Stub
    extends _RangeOfDateTimeStub {
  RangeOfDateTime_ThrowsValidatorParameterExceptionOnNullMax_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 1),
          validatorMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}
