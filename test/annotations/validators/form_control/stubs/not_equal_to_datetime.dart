import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _NotEqualToDateTimeStub
    extends IStub<FormControl<DateTime>, NotEqualToDateTime> {
  _NotEqualToDateTimeStub({
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
    super.validator = NotEqualToDateTime(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class NotEqualToDateTime_ValueDoesNotEqualValueToCompare_Stub
    extends _NotEqualToDateTimeStub {
  NotEqualToDateTime_ValueDoesNotEqualValueToCompare_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 2),
          validatorValueToCompare:
              const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class NotEqualToDateTime_NullValue_Stub extends _NotEqualToDateTimeStub {
  NotEqualToDateTime_NullValue_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare:
              const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* Value is not valid */
class NotEqualToDateTime_ValueEqualsValueToCompare_Stub
    extends _NotEqualToDateTimeStub {
  NotEqualToDateTime_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 1),
          validatorValueToCompare:
              const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* Remote parameters are provided */
class NotEqualToDateTime_ValueToCompareOnPropertyIsProvided_Stub
    extends _NotEqualToDateTimeStub {
  NotEqualToDateTime_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 2),
          fcValueToCompare: new DateTime(2021, 1, 2),
          validatorValueToCompare:
              const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* None parameter is provided */
class NotEqualToDateTime_ValueToCompareIsNotProvided_Stub
    extends _NotEqualToDateTimeStub {
  NotEqualToDateTime_ValueToCompareIsNotProvided_Stub()
      : super(fcValue: new DateTime(2021, 1, 2)) {}
}
