import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _EqualToIntStub extends ValidatorStub<FormControl<int>, EqualToInt> {
  _EqualToIntStub({
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
    super.validator = EqualToInt(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class EqualToInt_ValueEqualsValueToCompare_Stub extends _EqualToIntStub {
  EqualToInt_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 0,
        ) {}
}

class EqualToInt_ValueIsNull_Stub extends _EqualToIntStub {
  EqualToInt_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class EqualToInt_ValueDoesNotEqualValueToCompare_Stub extends _EqualToIntStub {
  EqualToInt_ValueDoesNotEqualValueToCompare_Stub()
      : super(
          fcValue: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class EqualToInt_ValueToCompareOnPropertyIsProvided_Stub
    extends _EqualToIntStub {
  EqualToInt_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 1,
          fcValueToCompare: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* Exceptions on parameters */
class EqualToInt_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _EqualToIntStub {
  EqualToInt_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(fcValue: 0) {}
}
