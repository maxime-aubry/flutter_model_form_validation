import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';

class _SmallerThanIntStub
    extends ValidatorStub<FormControl<int>, SmallerThanInt> {
  _SmallerThanIntStub({
    int value,
    int remoteValueToCompare,
    String remoteValueToCompareName,
    int localValueToCompare,
  }) {
    FormControl<int> _value = new FormControl<int>(
      value: value,
      validators: [],
    );
    FormControl<int> _valueToCompare = new FormControl<int>(
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
    super.validator = SmallerThanInt(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class SmallerThanInt_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerThanIntStub {
  SmallerThanInt_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 1,
        ) {}
}

class SmallerThanInt_ValueAndValueToCompareAreNull_Stub
    extends _SmallerThanIntStub {
  SmallerThanInt_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

class SmallerThanInt_ValueIsNull_Stub extends _SmallerThanIntStub {
  SmallerThanInt_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 0,
        ) {}
}

class SmallerThanInt_ValueToCompareIsNull_Stub extends _SmallerThanIntStub {
  SmallerThanInt_ValueToCompareIsNull_Stub()
      : super(
          value: 0,
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class SmallerThanInt_ValueIsGreaterThanValueToCompare_Stub
    extends _SmallerThanIntStub {
  SmallerThanInt_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 1,
          localValueToCompare: 0,
        ) {}
}

class SmallerThanInt_ValueIsEqualToValueToCompare_Stub
    extends _SmallerThanIntStub {
  SmallerThanInt_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class SmallerThanInt_remoteValueToCompareIsProvided_Stub
    extends _SmallerThanIntStub {
  SmallerThanInt_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 4,
          remoteValueToCompare: 5,
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 2,
        ) {}
}

/* Exceptions */
