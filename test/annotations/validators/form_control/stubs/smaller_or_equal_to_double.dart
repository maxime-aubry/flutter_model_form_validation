import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _SmallerOrEqualToDoubleStub
    extends IStub<FormControl<double>, SmallerOrEqualToDouble> {
  _SmallerOrEqualToDoubleStub({
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
    super.validator = SmallerOrEqualToDouble(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class SmallerOrEqualToDouble_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 1,
        ) {}
}

class SmallerOrEqualToDouble_ValueEqualsValueToCompare_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 0,
        ) {}
}

class SmallerOrEqualToDouble_NullValue_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_NullValue_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class SmallerOrEqualToDouble_ValueIsGreterThanValueToCompare_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_ValueIsGreterThanValueToCompare_Stub()
      : super(
          fcValue: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class SmallerOrEqualToDouble_ValueToCompareOnPropertyIsProvided_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 0,
          fcValueToCompare: 0,
          validatorValueToCompare: 1,
        ) {}
}

/* None parameter is provided */
class SmallerOrEqualToDouble_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _SmallerOrEqualToDoubleStub {
  SmallerOrEqualToDouble_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(fcValue: 1) {}
}
