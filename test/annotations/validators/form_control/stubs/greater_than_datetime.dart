import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _GreaterThanDateTimeStub
    extends IStub<FormControl<DateTime>, GreaterThanDateTime> {
  _GreaterThanDateTimeStub({
    DateTime fcValue,
    DateTime fcValueToCompare,
    ConstantDateTime validatorValueToCompare,
  }) {
    FormControl<DateTime> _value = new FormControl<DateTime>(
      value: fcValue,
      validators: [],
    );
    FormControl<DateTime> _valueToCompare = new FormControl<DateTime>(
      value: fcValueToCompare,
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
    super.validator = GreaterThanDateTime(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class GreaterThanDateTime_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterThanDateTimeStub {
  GreaterThanDateTime_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 2),
          validatorValueToCompare:
              const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class GreaterThanDateTime_NullValue_Stub extends _GreaterThanDateTimeStub {
  GreaterThanDateTime_NullValue_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare:
              const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* Value is not valid */
class GreaterThanDateTime_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterThanDateTimeStub {
  GreaterThanDateTime_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: new DateTime(2020, 12, 31),
          validatorValueToCompare:
              const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class GreaterThanDateTime_ValueEqualsValueToCompare_Stub
    extends _GreaterThanDateTimeStub {
  GreaterThanDateTime_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 1),
          validatorValueToCompare:
              const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* Remote parameters are provided */
class GreaterThanDateTime_ValueToCompareOnPropertyIsProvided_Stub
    extends _GreaterThanDateTimeStub {
  GreaterThanDateTime_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 2),
          fcValueToCompare: new DateTime(2021, 1, 2),
          validatorValueToCompare:
              const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* None parameter is provided */
class GreaterThanDateTime_ValueToCompareIsNotProvided_Stub
    extends _GreaterThanDateTimeStub {
  GreaterThanDateTime_ValueToCompareIsNotProvided_Stub()
      : super(fcValue: new DateTime(2021, 1, 2)) {}
}
