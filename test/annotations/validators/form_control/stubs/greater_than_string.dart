import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _GreaterThanStringStub
    extends IStub<FormControl<String>, GreaterThanString> {
  _GreaterThanStringStub({
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
    super.validator = GreaterThanString(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class GreaterThanString_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterThanStringStub {
  GreaterThanString_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          fcValue: 'b',
          validatorValueToCompare: 'a',
        ) {}
}

class GreaterThanString_NullValue_Stub extends _GreaterThanStringStub {
  GreaterThanString_NullValue_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 'a',
        ) {}
}

/* Value is not valid */
class GreaterThanString_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterThanStringStub {
  GreaterThanString_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: 'a',
          validatorValueToCompare: 'b',
        ) {}
}

class GreaterThanString_ValueEqualsValueToCompare_Stub
    extends _GreaterThanStringStub {
  GreaterThanString_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 'a',
          validatorValueToCompare: 'b',
        ) {}
}

/* Remote parameters are provided */
class GreaterThanString_ValueToCompareOnPropertyIsProvided_Stub
    extends _GreaterThanStringStub {
  GreaterThanString_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 'b',
          fcValueToCompare: 'b',
          validatorValueToCompare: 'a',
        ) {}
}

/* None parameter is provided */
class GreaterThanString_ValueToCompareIsNotProvided_Stub
    extends _GreaterThanStringStub {
  GreaterThanString_ValueToCompareIsNotProvided_Stub() : super(fcValue: 'b') {}
}
