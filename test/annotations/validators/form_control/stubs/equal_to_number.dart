import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _EqualToNumberStub
    extends ValidatorStub<FormControl<num>, EqualToNumber> {
  _EqualToNumberStub({
    num value,
    num remoteValueToCompare,
    String remoteValueToCompareName = 'valueToCompare',
    num localeValueToCompare,
  }) {
    FormControl<num> _value = new FormControl<num>(
      value: value,
      validators: [],
    );
    FormControl<num> _valueToCompare = new FormControl<num>(
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
    super.validator = EqualToNumber(
      valueToCompare: localeValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class EqualToNumber_ValueEqualsValueToCompare_Stub extends _EqualToNumberStub {
  EqualToNumber_ValueEqualsValueToCompare_Stub()
      : super(
          value: 0,
          localeValueToCompare: 0,
        ) {}
}

class EqualToNumber_ValueAndValueToCompareAreNull_Stub
    extends _EqualToNumberStub {
  EqualToNumber_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localeValueToCompare: null,
        ) {}
}

/* Value is not valid */
class EqualToNumber_ValueIsNull_Stub extends _EqualToNumberStub {
  EqualToNumber_ValueIsNull_Stub()
      : super(
          value: null,
          localeValueToCompare: 0,
        ) {}
}

class EqualToNumber_ValueToCompareIsNull_Stub extends _EqualToNumberStub {
  EqualToNumber_ValueToCompareIsNull_Stub()
      : super(
          value: 0,
          localeValueToCompare: null,
        ) {}
}

class EqualToNumber_ValueDoesNotEqualValueToCompare_Stub
    extends _EqualToNumberStub {
  EqualToNumber_ValueDoesNotEqualValueToCompare_Stub()
      : super(
          value: 1,
          localeValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class EqualToNumber_remoteValueToCompareIsProvided_Stub
    extends _EqualToNumberStub {
  EqualToNumber_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 1,
          remoteValueToCompare: 1,
          localeValueToCompare: 0,
        ) {}
}

/* Exceptions on parameters */
