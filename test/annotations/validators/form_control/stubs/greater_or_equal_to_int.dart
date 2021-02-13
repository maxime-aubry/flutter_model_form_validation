import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _GreaterOrEqualToIntStub
    extends IStub<FormControl<int>, GreaterOrEqualToInt> {
  _GreaterOrEqualToIntStub({
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
    super.validator = GreaterOrEqualToInt(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class GreaterOrEqualToInt_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterOrEqualToIntStub {
  GreaterOrEqualToInt_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          fcValue: 1,
          validatorValueToCompare: 0,
        ) {}
}

class GreaterOrEqualToInt_ValueEqualsValueToCompare_Stub
    extends _GreaterOrEqualToIntStub {
  GreaterOrEqualToInt_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 0,
        ) {}
}

class GreaterOrEqualToInt_NullValue_Stub extends _GreaterOrEqualToIntStub {
  GreaterOrEqualToInt_NullValue_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class GreaterOrEqualToInt_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterOrEqualToIntStub {
  GreaterOrEqualToInt_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 1,
        ) {}
}

/* Remote parameters are provided */
class GreaterOrEqualToInt_ValueToCompareOnPropertyIsProvided_Stub
    extends _GreaterOrEqualToIntStub {
  GreaterOrEqualToInt_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 1,
          fcValueToCompare: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* None parameter is provided */
class GreaterOrEqualToInt_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _GreaterOrEqualToIntStub {
  GreaterOrEqualToInt_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub() : super(fcValue: 1) {}
}
