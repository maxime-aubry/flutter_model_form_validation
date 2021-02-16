import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _GreaterOrEqualToDateTimeStub
    extends IStub<FormControl<DateTime>, GreaterOrEqualToDateTime> {
  _GreaterOrEqualToDateTimeStub({
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
    super.validator = GreaterOrEqualToDateTime(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class GreaterOrEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterOrEqualToDateTimeStub {
  GreaterOrEqualToDateTime_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 2),
          validatorValueToCompare:
              const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class GreaterOrEqualToDateTime_ValueEqualsValueToCompare_Stub
    extends _GreaterOrEqualToDateTimeStub {
  GreaterOrEqualToDateTime_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 1),
          validatorValueToCompare:
              const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

class GreaterOrEqualToDateTime_ValueIsNull_Stub
    extends _GreaterOrEqualToDateTimeStub {
  GreaterOrEqualToDateTime_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare:
              const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* Value is not valid */
class GreaterOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterOrEqualToDateTimeStub {
  GreaterOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 1),
          validatorValueToCompare:
              const ConstantDateTime('2021-01-02T00:00:00'),
        ) {}
}

/* Remote parameters are provided */
class GreaterOrEqualToDateTime_ValueToCompareOnPropertyIsProvided_Stub
    extends _GreaterOrEqualToDateTimeStub {
  GreaterOrEqualToDateTime_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 2),
          fcValueToCompare: new DateTime(2021, 1, 2),
          validatorValueToCompare:
              const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* Exceptions on parameters */
class GreaterOrEqualToDateTime_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _GreaterOrEqualToDateTimeStub {
  GreaterOrEqualToDateTime_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(fcValue: new DateTime(2021, 1, 2)) {}
}
