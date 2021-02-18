import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _SmallerOrEqualToNumberStub
    extends ValidatorStub<FormControl<num>, SmallerOrEqualToNumber> {
  _SmallerOrEqualToNumberStub({
    num fcValue,
    num fcValueToCompare,
    num validatorValueToCompare,
  }) {
    FormControl<num> _value = new FormControl<num>(
      value: fcValue,
      validators: [],
    );
    FormControl<num> _valueToCompare = new FormControl<num>(
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
    super.validator = SmallerOrEqualToNumber(
      valueToCompare: validatorValueToCompare,
      remoteValueToCompare:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class SmallerOrEqualToNumber_ValueEqualsValueToCompare_Stub
    extends _SmallerOrEqualToNumberStub {
  SmallerOrEqualToNumber_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 0,
        ) {}
}

class SmallerOrEqualToNumber_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerOrEqualToNumberStub {
  SmallerOrEqualToNumber_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 1,
        ) {}
}

class SmallerOrEqualToNumber_ValueIsNull_Stub
    extends _SmallerOrEqualToNumberStub {
  SmallerOrEqualToNumber_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class SmallerOrEqualToNumber_ValueIsGreterThanValueToCompare_Stub
    extends _SmallerOrEqualToNumberStub {
  SmallerOrEqualToNumber_ValueIsGreterThanValueToCompare_Stub()
      : super(
          fcValue: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class SmallerOrEqualToNumber_remoteValueToCompareIsProvided_Stub
    extends _SmallerOrEqualToNumberStub {
  SmallerOrEqualToNumber_remoteValueToCompareIsProvided_Stub()
      : super(
          fcValue: 0,
          fcValueToCompare: 0,
          validatorValueToCompare: 1,
        ) {}
}

/* Exceptions on parameters */
class SmallerOrEqualToNumber_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _SmallerOrEqualToNumberStub {
  SmallerOrEqualToNumber_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(fcValue: 1) {}
}
