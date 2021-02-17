import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _GreaterThanIntStub
    extends ValidatorStub<FormControl<int>, GreaterThanInt> {
  _GreaterThanIntStub({
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
    super.validator = GreaterThanInt(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class GreaterThanInt_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterThanIntStub {
  GreaterThanInt_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          fcValue: 1,
          validatorValueToCompare: 0,
        ) {}
}

class GreaterThanInt_ValueIsNull_Stub extends _GreaterThanIntStub {
  GreaterThanInt_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class GreaterThanInt_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterThanIntStub {
  GreaterThanInt_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: -1,
          validatorValueToCompare: 0,
        ) {}
}

class GreaterThanInt_ValueEqualsValueToCompare_Stub
    extends _GreaterThanIntStub {
  GreaterThanInt_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class GreaterThanInt_ValueToCompareOnPropertyIsProvided_Stub
    extends _GreaterThanIntStub {
  GreaterThanInt_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 1,
          fcValueToCompare: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* Exceptions on parameters */
class GreaterThanInt_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _GreaterThanIntStub {
  GreaterThanInt_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(fcValue: 1) {}
}
