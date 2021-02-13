import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _NotEqualToIntStub extends IStub<FormControl<int>, NotEqualToInt> {
  _NotEqualToIntStub({
    int fcValue,
    int fcValueToCompare,
    int validatorValueToCompare,
  }) {
    FormControl<int> _value = new FormControl<int>(
      value: fcValue,
      validators: [],
    );
    FormControl<int> _valueToCompare = new FormControl<int>(
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
    super.validator = NotEqualToInt(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class NotEqualToInt_ValueDoesNotEqualValueToCompare_Stub
    extends _NotEqualToIntStub {
  NotEqualToInt_ValueDoesNotEqualValueToCompare_Stub()
      : super(
          fcValue: 1,
          validatorValueToCompare: 0,
        ) {}
}

class NotEqualToInt_NullValue_Stub extends _NotEqualToIntStub {
  NotEqualToInt_NullValue_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class NotEqualToInt_ValueEqualsValueToCompare_Stub extends _NotEqualToIntStub {
  NotEqualToInt_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class NotEqualToInt_ValueToCompareOnPropertyIsProvided_Stub
    extends _NotEqualToIntStub {
  NotEqualToInt_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 1,
          fcValueToCompare: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* None parameter is provided */
class NotEqualToInt_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _NotEqualToIntStub {
  NotEqualToInt_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub() : super(fcValue: 0) {}
}
