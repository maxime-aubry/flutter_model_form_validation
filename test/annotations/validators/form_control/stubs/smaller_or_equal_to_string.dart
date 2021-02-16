import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _SmallerOrEqualToStringStub
    extends IStub<FormControl<String>, SmallerOrEqualToString> {
  _SmallerOrEqualToStringStub({
    String fcValue,
    String fcValueToCompare,
    String validatorValueToCompare,
  }) {
    FormControl<String> _value = new FormControl<String>(
      value: fcValue,
      validators: [],
    );
    FormControl<String> _valueToCompare = new FormControl<String>(
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
    super.validator = SmallerOrEqualToString(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class SmallerOrEqualToString_ValueEqualsValueToCompare_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 'a',
          validatorValueToCompare: 'a',
        ) {}
}

class SmallerOrEqualToString_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: 'a',
          validatorValueToCompare: 'b',
        ) {}
}

class SmallerOrEqualToString_ValueIsNull_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 'a',
        ) {}
}

/* Value is not valid */
class SmallerOrEqualToString_ValueIsGreterThanValueToCompare_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ValueIsGreterThanValueToCompare_Stub()
      : super(
          fcValue: 'a',
          validatorValueToCompare: 'b',
        ) {}
}

/* Remote parameters are provided */
class SmallerOrEqualToString_ValueToCompareOnPropertyIsProvided_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 'a',
          fcValueToCompare: 'a',
          validatorValueToCompare: 'b',
        ) {}
}

/* Exceptions on parameters */
class SmallerOrEqualToString_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(fcValue: 'b') {}
}
