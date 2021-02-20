import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _NotEqualToStringStub
    extends ValidatorStub<FormControl<String>, NotEqualToString> {
  _NotEqualToStringStub({
    String value,
    String remoteValueToCompare,
    String remoteValueToCompareName,
    String localValueToCompare,
  }) {
    FormControl<String> _value = new FormControl<String>(
      value: value,
      validators: [],
    );
    FormControl<String> _valueToCompare = new FormControl<String>(
      value: remoteValueToCompare,
      validators: [],
    );

    Map<String, AbstractControl> controls = {'value': _value};
    if (remoteValueToCompareName != null)
      controls[remoteValueToCompareName] = _valueToCompare;

    FormGroup _root = new FormGroup(
      controls: controls,
      validators: [],
    );

    _value.parentGroup = _root;
    _valueToCompare.parentGroup = _root;

    super.control = _value;
    super.validator = NotEqualToString(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class NotEqualToString_ValueIsSmallerThanValueToCompare_Stub
    extends _NotEqualToStringStub {
  NotEqualToString_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 'a',
          localValueToCompare: 'b',
        ) {}
}

class NotEqualToString_ValueIsGreaterThanValueToCompare_Stub
    extends _NotEqualToStringStub {
  NotEqualToString_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 'b',
          localValueToCompare: 'a',
        ) {}
}

class NotEqualToString_ValueAndValueToCompareAreNull_Stub
    extends _NotEqualToStringStub {
  NotEqualToString_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class NotEqualToString_ValueIsNull_Stub extends _NotEqualToStringStub {
  NotEqualToString_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 'a',
        ) {}
}

class NotEqualToString_ValueToCompareIsNull_Stub extends _NotEqualToStringStub {
  NotEqualToString_ValueToCompareIsNull_Stub()
      : super(
          value: 'a',
          localValueToCompare: null,
        ) {}
}

class NotEqualToString_ValueIsEqualToValueToCompare_Stub
    extends _NotEqualToStringStub {
  NotEqualToString_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: 'a',
          localValueToCompare: 'a',
        ) {}
}

/* Remote parameters are provided */
class NotEqualToString_remoteValueToCompareIsProvided_Stub
    extends _NotEqualToStringStub {
  NotEqualToString_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 'b',
          remoteValueToCompare: 'b',
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 'a',
        ) {}
}

/* Exceptions */
