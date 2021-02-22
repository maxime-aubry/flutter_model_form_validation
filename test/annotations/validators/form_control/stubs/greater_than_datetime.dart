import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../../../stubs.dart';

class _GreaterThanDateTimeStub
    extends ValidatorStub<FormControl<DateTime>, GreaterThanDateTime> {
  _GreaterThanDateTimeStub({
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
    super.validator = GreaterThanDateTime(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class GreaterThanDateTime_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterThanDateTimeStub {
  GreaterThanDateTime_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: new DateTime(2021, 1, 2),
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class GreaterThanDateTime_ValueAndValueToCompareAreNull_Stub
    extends _GreaterThanDateTimeStub {
  GreaterThanDateTime_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

class GreaterThanDateTime_ValueIsNull_Stub extends _GreaterThanDateTimeStub {
  GreaterThanDateTime_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class GreaterThanDateTime_ValueToCompareIsNull_Stub
    extends _GreaterThanDateTimeStub {
  GreaterThanDateTime_ValueToCompareIsNull_Stub()
      : super(
          value: new DateTime(2021, 1, 1),
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class GreaterThanDateTime_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterThanDateTimeStub {
  GreaterThanDateTime_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: new DateTime(2021, 1, 1),
          localValueToCompare: const ConstantDateTime('2021-01-02T00:00:00'),
        ) {}
}

class GreaterThanDateTime_ValueIsEqualToValueToCompare_Stub
    extends _GreaterThanDateTimeStub {
  GreaterThanDateTime_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: new DateTime(2021, 1, 1),
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* Remote parameters are provided */
class GreaterThanDateTime_remoteValueToCompareIsProvided_Stub
    extends _GreaterThanDateTimeStub {
  GreaterThanDateTime_remoteValueToCompareIsProvided_Stub()
      : super(
          value: new DateTime(2021, 1, 2),
          remoteValueToCompare: new DateTime(2021, 1, 1),
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: const ConstantDateTime('2021-01-10T00:00:00'),
        ) {}
}

/* Exceptions */
