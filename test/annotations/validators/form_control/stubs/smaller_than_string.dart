import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';

class _SmallerThanStringStub
    extends ValidatorStub<FormControl<String>, SmallerThanString> {
  _SmallerThanStringStub({
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

    _value.parent = _root;
    _valueToCompare.parent = _root;

    super.control = _value;
    super.validator = SmallerThanString(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class SmallerThanString_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerThanStringStub {
  SmallerThanString_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 'a',
          localValueToCompare: 'b',
        ) {}
}

class SmallerThanString_ValueAndValueToCompareAreNull_Stub
    extends _SmallerThanStringStub {
  SmallerThanString_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

class SmallerThanString_ValueIsNull_Stub extends _SmallerThanStringStub {
  SmallerThanString_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 'a',
        ) {}
}

class SmallerThanString_ValueToCompareIsNull_Stub
    extends _SmallerThanStringStub {
  SmallerThanString_ValueToCompareIsNull_Stub()
      : super(
          value: 'a',
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class SmallerThanString_ValueIsGreaterThanValueToCompare_Stub
    extends _SmallerThanStringStub {
  SmallerThanString_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 'b',
          localValueToCompare: 'a',
        ) {}
}

class SmallerThanString_ValueIsEqualToValueToCompare_Stub
    extends _SmallerThanStringStub {
  SmallerThanString_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: 'a',
          localValueToCompare: 'a',
        ) {}
}

/* Remote parameters are provided */
class SmallerThanString_remoteValueToCompareIsProvided_Stub
    extends _SmallerThanStringStub {
  SmallerThanString_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 'c',
          remoteValueToCompare: 'd',
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 'b',
        ) {}
}

/* Exceptions */
