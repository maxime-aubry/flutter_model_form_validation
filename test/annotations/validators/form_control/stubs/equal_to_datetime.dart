import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _EqualToDateTimeStub
    extends ValidatorStub<FormControl<DateTime>, EqualToDateTime> {
  _EqualToDateTimeStub({
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
    super.validator = EqualToDateTime(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class EqualToDateTime_ValueEqualsValueToCompare_Stub
    extends _EqualToDateTimeStub {
  EqualToDateTime_ValueEqualsValueToCompare_Stub()
      : super(
          value: new DateTime(2021, 1, 1),
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class EqualToDateTime_ValueAndValueToCompareAreNull_Stub
    extends _EqualToDateTimeStub {
  EqualToDateTime_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class EqualToDateTime_ValueIsNull_Stub extends _EqualToDateTimeStub {
  EqualToDateTime_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class EqualToDateTime_ValueToCompareIsNull_Stub extends _EqualToDateTimeStub {
  EqualToDateTime_ValueToCompareIsNull_Stub()
      : super(
          value: new DateTime(2021, 1, 1),
          localValueToCompare: null,
        ) {}
}

class EqualToDateTime_ValueDoesNotEqualValueToCompare_Stub
    extends _EqualToDateTimeStub {
  EqualToDateTime_ValueDoesNotEqualValueToCompare_Stub()
      : super(
          value: new DateTime(2021, 1, 2),
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* Remote parameters are provided */
class EqualToDateTime_remoteValueToCompareIsProvided_Stub
    extends _EqualToDateTimeStub {
  EqualToDateTime_remoteValueToCompareIsProvided_Stub()
      : super(
          value: new DateTime(2021, 1, 2),
          remoteValueToCompare: new DateTime(2021, 1, 2),
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* Exceptions on parameters */
