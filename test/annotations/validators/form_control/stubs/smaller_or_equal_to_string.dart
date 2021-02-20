import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

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
class SmallerOrEqualToString_ValueIsEqualToValueToCompare_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: 'a',
          localValueToCompare: 'a',
        ) {}
}

class SmallerOrEqualToString_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 'a',
          localValueToCompare: 'b',
        ) {}
}

class SmallerOrEqualToString_ValueIsNull_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 'a',
        ) {}
}

/* Value is not valid */
class SmallerOrEqualToString_ValueIsGreterThanValueToCompare_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ValueIsGreterThanValueToCompare_Stub()
      : super(
          value: 'a',
          localValueToCompare: 'b',
        ) {}
}

/* Remote parameters are provided */
class SmallerOrEqualToString_remoteValueToCompareIsProvided_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 'a',
          remoteValueToCompare: 'a',
          localValueToCompare: 'b',
        ) {}
}

/* Exceptions */
class SmallerOrEqualToString_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _SmallerOrEqualToStringStub {
  SmallerOrEqualToString_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(value: 'b') {}
}
