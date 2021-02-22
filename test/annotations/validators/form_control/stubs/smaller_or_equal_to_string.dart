import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../../../stubs.dart';

class _SmallerOrEqualToStringStub
    extends ValidatorStub<FormControl<String>, SmallerOrEqualToString> {
  _SmallerOrEqualToStringStub({
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
    super.validator = SmallerOrEqualToString(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class SmallerOrEqualToString_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 'a',
          localValueToCompare: 'b',
        ) {}
}

class SmallerOrEqualToString_ValueIsEqualToValueToCompare_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: 'a',
          localValueToCompare: 'b',
        ) {}
}

class SmallerOrEqualToString_ValueAndValueToCompareAreNull_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

class SmallerOrEqualToString_ValueIsNull_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 'b',
        ) {}
}

class SmallerOrEqualToString_ValueToCompareIsNull_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ValueToCompareIsNull_Stub()
      : super(
          value: 'a',
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class SmallerOrEqualToString_ValueIsGreaterThanValueToCompare_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 'b',
          localValueToCompare: 'a',
        ) {}
}

/* Remote parameters are provided */
class SmallerOrEqualToString_remoteValueToCompareIsProvided_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 'c',
          remoteValueToCompare: 'd',
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 'b',
        ) {}
}

/* Exceptions */
