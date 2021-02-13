import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _SmallerOrEqualToDateTimeStub
    extends IStub<FormControl<DateTime>, SmallerOrEqualToDateTime> {
  _SmallerOrEqualToDateTimeStub({
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
    super.validator = SmallerOrEqualToDateTime(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class SmallerOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerOrEqualToDateTimeStub {
  SmallerOrEqualToDateTime_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 1),
          validatorValueToCompare:
              const ConstantDateTime('2021-01-02T00:00:00'),
        ) {}
}

class SmallerOrEqualToDateTime_ValueEqualsValueToCompare_Stub
    extends _SmallerOrEqualToDateTimeStub {
  SmallerOrEqualToDateTime_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 1),
          validatorValueToCompare:
              const ConstantDateTime('2021-01-02T00:00:00'),
        ) {}
}

class SmallerOrEqualToDateTime_NullValue_Stub
    extends _SmallerOrEqualToDateTimeStub {
  SmallerOrEqualToDateTime_NullValue_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare:
              const ConstantDateTime('2021-01-02T00:00:00'),
        ) {}
}

/* Value is not valid */
class SmallerOrEqualToDateTime_ValueIsGreterThanValueToCompare_Stub
    extends _SmallerOrEqualToDateTimeStub {
  SmallerOrEqualToDateTime_ValueIsGreterThanValueToCompare_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 2),
          validatorValueToCompare:
              const ConstantDateTime('2021-01-01T00:00:00'),
        ) {}
}

/* Remote parameters are provided */
class SmallerOrEqualToDateTime_ValueToCompareOnPropertyIsProvided_Stub
    extends _SmallerOrEqualToDateTimeStub {
  SmallerOrEqualToDateTime_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: new DateTime(2021, 1, 1),
          fcValueToCompare: new DateTime(2021, 1, 1),
          validatorValueToCompare:
              const ConstantDateTime('2021-01-02T00:00:00'),
        ) {}
}

/* None parameter is provided */
class SmallerOrEqualToDateTime_ValueToCompareIsNotProvided_Stub
    extends _SmallerOrEqualToDateTimeStub {
  SmallerOrEqualToDateTime_ValueToCompareIsNotProvided_Stub()
      : super(fcValue: new DateTime(2021, 1, 1)) {}
}
