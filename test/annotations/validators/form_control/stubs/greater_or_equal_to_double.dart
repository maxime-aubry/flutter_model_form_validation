import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _GreaterOrEqualToDoubleStub
    extends ValidatorStub<FormControl<double>, GreaterOrEqualToDouble> {
  _GreaterOrEqualToDoubleStub({
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
    super.validator = GreaterOrEqualToDouble(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class GreaterOrEqualToDouble_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterOrEqualToDoubleStub {
  GreaterOrEqualToDouble_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          fcValue: 1,
          validatorValueToCompare: 0,
        ) {}
}

class GreaterOrEqualToDouble_ValueEqualsValueToCompare_Stub
    extends _GreaterOrEqualToDoubleStub {
  GreaterOrEqualToDouble_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 0,
        ) {}
}

class GreaterOrEqualToDouble_ValueIsNull_Stub
    extends _GreaterOrEqualToDoubleStub {
  GreaterOrEqualToDouble_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class GreaterOrEqualToDouble_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterOrEqualToDoubleStub {
  GreaterOrEqualToDouble_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 1,
        ) {}
}

/* Remote parameters are provided */
class GreaterOrEqualToDouble_ValueToCompareOnPropertyIsProvided_Stub
    extends _GreaterOrEqualToDoubleStub {
  GreaterOrEqualToDouble_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 1,
          fcValueToCompare: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* Exceptions on parameters */
class GreaterOrEqualToDouble_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _GreaterOrEqualToDoubleStub {
  GreaterOrEqualToDouble_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(fcValue: 1) {}
}
