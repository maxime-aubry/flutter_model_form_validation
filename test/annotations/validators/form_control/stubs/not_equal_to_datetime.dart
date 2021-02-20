import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _NotEqualToDateTimeStub
    extends ValidatorStub<FormControl<DateTime>, NotEqualToDateTime> {
  _NotEqualToDateTimeStub({
    DateTime value,
    DateTime remoteValueToCompare,
    String remoteValueToCompareName,
    ConstantDateTime localValueToCompare,
  }) {
    FormControl<DateTime> _value = new FormControl<DateTime>(
      value: value,
      validators: [],
    );
    FormControl<DateTime> _valueToCompare = new FormControl<DateTime>(
      value: remoteValueToCompare,
      validators: [],
    );

    Map<String, AbstractControl> controls = {'value': _value};
    if (remoteValueToCompareName != null)
      controls[remoteValueToCompareName] = _valueToCompare;

    FormGroup _root = new FormGroup(
      controls: controls,
      validators: [],
    );

    _value.parentGroup = _root;
    _valueToCompare.parentGroup = _root;

    super.control = _value;
    super.validator = NotEqualToDateTime(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class NotEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub
    extends _NotEqualToDateTimeStub {
  NotEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: new DateTime(2020, 12, 31),
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class NotEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub
    extends _NotEqualToDateTimeStub {
  NotEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: new DateTime(2021, 1, 2),
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class NotEqualToDateTime_ValueAndValueToCompareAreNull_Stub
    extends _NotEqualToDateTimeStub {
  NotEqualToDateTime_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class NotEqualToDateTime_ValueIsNull_Stub extends _NotEqualToDateTimeStub {
  NotEqualToDateTime_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class NotEqualToDateTime_ValueToCompareIsNull_Stub
    extends _NotEqualToDateTimeStub {
  NotEqualToDateTime_ValueToCompareIsNull_Stub()
      : super(
          value: new DateTime(2021, 1, 1),
          localValueToCompare: null,
        ) {}
}

class NotEqualToDateTime_ValueIsEqualToValueToCompare_Stub
    extends _NotEqualToDateTimeStub {
  NotEqualToDateTime_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: new DateTime(2021, 1, 1),
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* Remote parameters are provided */
class NotEqualToDateTime_remoteValueToCompareIsProvided_Stub
    extends _NotEqualToDateTimeStub {
  NotEqualToDateTime_remoteValueToCompareIsProvided_Stub()
      : super(
          value: new DateTime(2021, 1, 2),
          remoteValueToCompare: new DateTime(2021, 1, 2),
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* Exceptions */
