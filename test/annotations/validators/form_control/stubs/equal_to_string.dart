import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _EqualToStringStub
    extends ValidatorStub<FormControl<String>, EqualToString> {
  _EqualToStringStub({
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
    super.validator = EqualToString(
      valueToCompare: localeValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class EqualToString_ValueEqualsValueToCompare_Stub extends _EqualToStringStub {
  EqualToString_ValueEqualsValueToCompare_Stub()
      : super(
          value: 'a',
          localeValueToCompare: 'a',
        ) {}
}

class EqualToString_ValueAndValueToCompareAreNull_Stub
    extends _EqualToStringStub {
  EqualToString_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localeValueToCompare: null,
        ) {}
}

/* Value is not valid */
class EqualToString_ValueIsNull_Stub extends _EqualToStringStub {
  EqualToString_ValueIsNull_Stub()
      : super(
          value: null,
          localeValueToCompare: 'a',
        ) {}
}

class EqualToString_ValueToCompareIsNull_Stub extends _EqualToStringStub {
  EqualToString_ValueToCompareIsNull_Stub()
      : super(
          value: 'a',
          localeValueToCompare: null,
        ) {}
}

class EqualToString_ValueDoesNotEqualValueToCompare_Stub
    extends _EqualToStringStub {
  EqualToString_ValueDoesNotEqualValueToCompare_Stub()
      : super(
          value: 'b',
          localeValueToCompare: 'a',
        ) {}
}

/* Remote parameters are provided */
class EqualToString_remoteValueToCompareIsProvided_Stub
    extends _EqualToStringStub {
  EqualToString_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 'b',
          remoteValueToCompare: 'b',
          localeValueToCompare: 'a',
        ) {}
}

/* Exceptions on parameters */
