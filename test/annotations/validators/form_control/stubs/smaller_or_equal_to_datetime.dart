import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';

class _SmallerOrEqualToDateTimeStub
    extends ValidatorStub<FormControl<DateTime>, SmallerOrEqualToDateTime> {
  _SmallerOrEqualToDateTimeStub({
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

    _value.parent = _root;
    _valueToCompare.parent = _root;

    super.control = _value;
    super.validator = SmallerOrEqualToDateTime(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class SmallerOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerOrEqualToDateTimeStub {
  SmallerOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: new DateTime(2021, 1, 1),
          localValueToCompare: const ConstantDateTime('2021-01-02T00:00:00'),
        ) {}
}

class SmallerOrEqualToDateTime_ValueIsEqualToValueToCompare_Stub
    extends _SmallerOrEqualToDateTimeStub {
  SmallerOrEqualToDateTime_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: new DateTime(2021, 1, 1),
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class SmallerOrEqualToDateTime_ValueAndValueToCompareAreNull_Stub
    extends _SmallerOrEqualToDateTimeStub {
  SmallerOrEqualToDateTime_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

class SmallerOrEqualToDateTime_ValueIsNull_Stub
    extends _SmallerOrEqualToDateTimeStub {
  SmallerOrEqualToDateTime_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class SmallerOrEqualToDateTime_ValueToCompareIsNull_Stub
    extends _SmallerOrEqualToDateTimeStub {
  SmallerOrEqualToDateTime_ValueToCompareIsNull_Stub()
      : super(
          value: new DateTime(2021, 1, 1),
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class SmallerOrEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub
    extends _SmallerOrEqualToDateTimeStub {
  SmallerOrEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: new DateTime(2021, 1, 2),
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* Remote parameters are provided */
class SmallerOrEqualToDateTime_remoteValueToCompareIsProvided_Stub
    extends _SmallerOrEqualToDateTimeStub {
  SmallerOrEqualToDateTime_remoteValueToCompareIsProvided_Stub()
      : super(
          value: new DateTime(2021, 1, 2),
          remoteValueToCompare: new DateTime(2021, 1, 2),
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* Exceptions */
