import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

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

    _value.parentGroup = _root;
    _valueToCompare.parentGroup = _root;

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

class SmallerThanString_ValueIsNull_Stub extends _SmallerThanStringStub {
  SmallerThanString_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 'a',
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
