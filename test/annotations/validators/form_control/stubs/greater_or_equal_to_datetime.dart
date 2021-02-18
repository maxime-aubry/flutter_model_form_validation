import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _GreaterOrEqualToDateTimeStub
    extends ValidatorStub<FormControl<DateTime>, GreaterOrEqualToDateTime> {
  _GreaterOrEqualToDateTimeStub({
    DateTime value,
    DateTime remoteValueToCompare,
    String remoteValueToCompareName = 'valueToCompare',
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
    FormGroup _root = new FormGroup(
      controls: {
        'value': _value,
        'valueToCompare': _valueToCompare,
      },
      validators: [],
    );
    _value.parentGroup = _root;
    _valueToCompare.parentGroup = _root;

    super.control = _value;
    super.validator = GreaterOrEqualToDateTime(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class GreaterOrEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterOrEqualToDateTimeStub {
  GreaterOrEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: new DateTime(2021, 1, 2),
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class GreaterOrEqualToDateTime_ValueEqualsValueToCompare_Stub
    extends _GreaterOrEqualToDateTimeStub {
  GreaterOrEqualToDateTime_ValueEqualsValueToCompare_Stub()
      : super(
          value: new DateTime(2021, 1, 1),
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class GreaterOrEqualToDateTime_ValueAndValueToCompareAreNull_Stub
    extends _GreaterOrEqualToDateTimeStub {
  GreaterOrEqualToDateTime_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class GreaterOrEqualToDateTime_ValueIsNull_Stub
    extends _GreaterOrEqualToDateTimeStub {
  GreaterOrEqualToDateTime_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class GreaterOrEqualToDateTime_ValueToCompareIsNull_Stub
    extends _GreaterOrEqualToDateTimeStub {
  GreaterOrEqualToDateTime_ValueToCompareIsNull_Stub()
      : super(
          value: new DateTime(2021, 1, 1),
          localValueToCompare: null,
        ) {}
}

class GreaterOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterOrEqualToDateTimeStub {
  GreaterOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: new DateTime(2021, 1, 1),
          localValueToCompare: const ConstantDateTime('2021-01-02T00:00:00'),
        ) {}
}

/* Remote parameters are provided */
class GreaterOrEqualToDateTime_remoteValueToCompareIsProvided_Stub
    extends _GreaterOrEqualToDateTimeStub {
  GreaterOrEqualToDateTime_remoteValueToCompareIsProvided_Stub()
      : super(
          value: new DateTime(2021, 1, 2),
          remoteValueToCompare: new DateTime(2021, 1, 2),
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* Exceptions on parameters */
