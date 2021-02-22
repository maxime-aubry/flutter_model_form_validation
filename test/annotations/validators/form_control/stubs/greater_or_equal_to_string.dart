import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _GreaterOrEqualToStringStub
    extends ValidatorStub<FormControl<String>, GreaterOrEqualToString> {
  _GreaterOrEqualToStringStub({
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
    super.validator = GreaterOrEqualToString(
      valueToCompare: localValueToCompare,
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
          localValueToCompare: 'a',
        ) {}
}

class GreaterOrEqualToString_ValueIsEqualToValueToCompare_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: 'a',
          localValueToCompare: 'a',
        ) {}
}

class GreaterOrEqualToString_ValueAndValueToCompareAreNull_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

class GreaterOrEqualToString_ValueIsNull_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 'a',
        ) {}
}

class GreaterOrEqualToString_ValueToCompareIsNull_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ValueToCompareIsNull_Stub()
      : super(
          value: 'a',
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class GreaterOrEqualToString_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 'a',
          localValueToCompare: 'b',
        ) {}
}

/* Remote parameters are provided */
class GreaterOrEqualToString_remoteValueToCompareIsProvided_Stub
    extends _GreaterOrEqualToStringStub {
  GreaterOrEqualToString_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 'b',
          remoteValueToCompare: 'b',
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 'a',
        ) {}
}

/* Exceptions */
