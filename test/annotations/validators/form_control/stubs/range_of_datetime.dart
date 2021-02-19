import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _RangeOfDateTimeStub
    extends ValidatorStub<FormControl<DateTime>, RangeOfDateTime> {
  _RangeOfDateTimeStub({
    DateTime value,
    DateTime remoteMin,
    DateTime remoteMax,
    String remoteMinName,
    String remoteMaxName,
    ConstantDateTime localMin,
    ConstantDateTime localMax,
  }) {
    FormControl<DateTime> _value = new FormControl<DateTime>(
      value: value,
      validators: [],
    );
    FormControl<DateTime> _min = new FormControl<DateTime>(
      value: remoteMin,
      validators: [],
    );
    FormControl<DateTime> _max = new FormControl<DateTime>(
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
    super.validator = RangeOfDateTime(
      min: localMin,
      max: localMax,
      remoteMin: remoteMinName,
      remoteMax: remoteMaxName,
      error: null,
    );
  }
}

/* Value is valid */
class RangeOfDateTime_ValueIsEqualToMin_Stub extends _RangeOfDateTimeStub {
  RangeOfDateTime_ValueIsEqualToMin_Stub()
      : super(
          value: new DateTime(2021, 1, 1),
          localMin: const ConstantDateTime('2021-01-01T00:00:00'),
          localMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}

class RangeOfDateTime_ValueIsEqualToMax_Stub extends _RangeOfDateTimeStub {
  RangeOfDateTime_ValueIsEqualToMax_Stub()
      : super(
          value: new DateTime(2021, 12, 31),
          localMin: const ConstantDateTime('2021-01-01T00:00:00'),
          localMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}

class RangeOfDateTime_ValueIsBetweenMinAndMax_Stub
    extends _RangeOfDateTimeStub {
  RangeOfDateTime_ValueIsBetweenMinAndMax_Stub()
      : super(
          value: new DateTime(2021, 6, 1),
          localMin: const ConstantDateTime('2021-01-01T00:00:00'),
          localMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}

class RangeOfDateTime_ValueIsNull_Stub extends _RangeOfDateTimeStub {
  RangeOfDateTime_ValueIsNull_Stub()
      : super(
          value: null,
          localMin: const ConstantDateTime('2021-01-01T00:00:00'),
          localMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}

/* Value is not valid */
class RangeOfDateTime_ValueIsSmallerThanMin_Stub extends _RangeOfDateTimeStub {
  RangeOfDateTime_ValueIsSmallerThanMin_Stub()
      : super(
          value: new DateTime(2020, 12, 31),
          localMin: const ConstantDateTime('2021-01-01T00:00:00'),
          localMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}

class RangeOfDateTime_ValueIsGreaterThanMax_Stub extends _RangeOfDateTimeStub {
  RangeOfDateTime_ValueIsGreaterThanMax_Stub()
      : super(
          value: new DateTime(2022, 1, 1),
          localMin: const ConstantDateTime('2021-01-01T00:00:00'),
          localMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}

/* Remote parameters are provided */
class RangeOfDateTime_remoteMinIsProvided_Stub extends _RangeOfDateTimeStub {
  RangeOfDateTime_remoteMinIsProvided_Stub()
      : super(
          value: new DateTime(2020, 6, 1),
          remoteMin: new DateTime(2020, 1, 1),
          localMin: const ConstantDateTime('2021-01-01T00:00:00'),
          localMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}

class RangeOfDateTime_remoteMaxIsProvided_Stub extends _RangeOfDateTimeStub {
  RangeOfDateTime_remoteMaxIsProvided_Stub()
      : super(
          value: new DateTime(2022, 6, 1),
          remoteMax: new DateTime(2022, 12, 31),
          localMin: const ConstantDateTime('2021-01-01T00:00:00'),
          localMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}

/* Exceptions on parameters */
class RangeOfDateTime_ThrowsValidatorParameterExceptionOnNullMin_Stub
    extends _RangeOfDateTimeStub {
  RangeOfDateTime_ThrowsValidatorParameterExceptionOnNullMin_Stub()
      : super(
          value: new DateTime(2021, 1, 1),
          localMin: const ConstantDateTime('2021-01-01T00:00:00'),
        );
}

class RangeOfDateTime_ThrowsValidatorParameterExceptionOnNullMax_Stub
    extends _RangeOfDateTimeStub {
  RangeOfDateTime_ThrowsValidatorParameterExceptionOnNullMax_Stub()
      : super(
          value: new DateTime(2021, 1, 1),
          localMax: const ConstantDateTime('2021-12-31T00:00:00'),
        );
}
