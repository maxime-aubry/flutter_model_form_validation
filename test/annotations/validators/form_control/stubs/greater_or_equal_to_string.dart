import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _GreaterOrEqualToStringStub
    extends ValidatorStub<FormControl<String>, GreaterOrEqualToString> {
  _GreaterOrEqualToStringStub({
    String value,
    String remoteValueToCompare,
    String remoteValueToCompareName = 'valueToCompare',
    String localeValueToCompare,
  }) {
    FormControl<String> _value = new FormControl<String>(
      value: value,
      validators: [],
    );
    FormControl<String> _valueToCompare = new FormControl<String>(
      value: remoteValueToCompare,
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
    super.validator = GreaterOrEqualToString(
      valueToCompare: localeValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class GreaterOrEqualToString_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 'b',
          localeValueToCompare: 'a',
        ) {}
}

class GreaterOrEqualToString_ValueEqualsValueToCompare_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ValueEqualsValueToCompare_Stub()
      : super(
          value: 'a',
          localeValueToCompare: 'a',
        ) {}
}

class GreaterOrEqualToString_ValueAndValueToCompareAreNull_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localeValueToCompare: null,
        ) {}
}

/* Value is not valid */
class GreaterOrEqualToString_ValueIsNull_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ValueIsNull_Stub()
      : super(
          value: null,
          localeValueToCompare: 'a',
        ) {}
}

class GreaterOrEqualToString_ValueToCompareIsNull_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ValueToCompareIsNull_Stub()
      : super(
          value: 'a',
          localeValueToCompare: null,
        ) {}
}

class GreaterOrEqualToString_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 'a',
          localeValueToCompare: 'b',
        ) {}
}

/* Remote parameters are provided */
class GreaterOrEqualToString_remoteValueToCompareIsProvided_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 'b',
          remoteValueToCompare: 'b',
          localeValueToCompare: 'a',
        ) {}
}

/* Exceptions on parameters */
