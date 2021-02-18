import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _EqualToDoubleStub
    extends ValidatorStub<FormControl<double>, EqualToDouble> {
  _EqualToDoubleStub({
    double value,
    double remoteValueToCompare,
    String remoteValueToCompareName = 'valueToCompare',
    double localeValueToCompare,
  }) {
    FormControl<double> _value = new FormControl<double>(
      value: value,
      validators: [],
    );
    FormControl<double> _valueToCompare = new FormControl<double>(
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
    super.validator = EqualToDouble(
      valueToCompare: localeValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class EqualToDouble_ValueEqualsValueToCompare_Stub extends _EqualToDoubleStub {
  EqualToDouble_ValueEqualsValueToCompare_Stub()
      : super(
          value: 0,
          localeValueToCompare: 0,
        ) {}
}

class EqualToDouble_ValueAndValueToCompareAreNull_Stub
    extends _EqualToDoubleStub {
  EqualToDouble_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localeValueToCompare: null,
        ) {}
}

/* Value is not valid */
class EqualToDouble_ValueIsNull_Stub extends _EqualToDoubleStub {
  EqualToDouble_ValueIsNull_Stub()
      : super(
          value: null,
          localeValueToCompare: 0,
        ) {}
}

class EqualToDouble_ValueToCompareIsNull_Stub extends _EqualToDoubleStub {
  EqualToDouble_ValueToCompareIsNull_Stub()
      : super(
          value: 0,
          localeValueToCompare: null,
        ) {}
}

class EqualToDouble_ValueDoesNotEqualValueToCompare_Stub
    extends _EqualToDoubleStub {
  EqualToDouble_ValueDoesNotEqualValueToCompare_Stub()
      : super(
          value: 1,
          localeValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class EqualToDouble_remoteValueToCompareIsProvided_Stub
    extends _EqualToDoubleStub {
  EqualToDouble_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 1,
          remoteValueToCompare: 1,
          localeValueToCompare: 0,
        ) {}
}

/* Exceptions on parameters */
