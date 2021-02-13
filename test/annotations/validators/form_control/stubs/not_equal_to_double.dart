import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _NotEqualToDoubleStub
    extends IStub<FormControl<double>, NotEqualToDouble> {
  _NotEqualToDoubleStub({
    double fcValue,
    double fcValueToCompare,
    double validatorValueToCompare,
  }) {
    FormControl<double> _value = new FormControl<double>(
      value: fcValue,
      validators: [],
    );
    FormControl<double> _valueToCompare = new FormControl<double>(
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
    super.validator = NotEqualToDouble(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class NotEqualToDouble_ValueDoesNotEqualValueToCompare_Stub
    extends _NotEqualToDoubleStub {
  NotEqualToDouble_ValueDoesNotEqualValueToCompare_Stub()
      : super(
          fcValue: 1,
          validatorValueToCompare: 0,
        ) {}
}

class NotEqualToDouble_NullValue_Stub extends _NotEqualToDoubleStub {
  NotEqualToDouble_NullValue_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class NotEqualToDouble_ValueEqualsValueToCompare_Stub
    extends _NotEqualToDoubleStub {
  NotEqualToDouble_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class NotEqualToDouble_ValueToCompareOnPropertyIsProvided_Stub
    extends _NotEqualToDoubleStub {
  NotEqualToDouble_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 1,
          fcValueToCompare: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* None parameter is provided */
class NotEqualToDouble_ValueToCompareIsNotProvided_Stub
    extends _NotEqualToDoubleStub {
  NotEqualToDouble_ValueToCompareIsNotProvided_Stub() : super(fcValue: 0) {}
}
