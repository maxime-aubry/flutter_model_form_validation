import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _GreaterOrEqualToDoubleStub
    extends ValidatorStub<FormControl<double>, GreaterOrEqualToDouble> {
  _GreaterOrEqualToDoubleStub({
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
    super.validator = GreaterOrEqualToDouble(
      valueToCompare: localeValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class GreaterOrEqualToDouble_ValueIsGreaterThanValueToCompare_Stub
    extends _GreaterOrEqualToDoubleStub {
  GreaterOrEqualToDouble_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 1,
          localeValueToCompare: 0,
        ) {}
}

class GreaterOrEqualToDouble_ValueEqualsValueToCompare_Stub
    extends _GreaterOrEqualToDoubleStub {
  GreaterOrEqualToDouble_ValueEqualsValueToCompare_Stub()
      : super(
          value: 0,
          localeValueToCompare: 0,
        ) {}
}

class GreaterOrEqualToDouble_ValueAndValueToCompareAreNull_Stub
    extends _GreaterOrEqualToDoubleStub {
  GreaterOrEqualToDouble_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localeValueToCompare: null,
        ) {}
}

/* Value is not valid */
class GreaterOrEqualToDouble_ValueIsNull_Stub
    extends _GreaterOrEqualToDoubleStub {
  GreaterOrEqualToDouble_ValueIsNull_Stub()
      : super(
          value: null,
          localeValueToCompare: 0,
        ) {}
}

class GreaterOrEqualToDouble_ValueToCompareIsNull_Stub
    extends _GreaterOrEqualToDoubleStub {
  GreaterOrEqualToDouble_ValueToCompareIsNull_Stub()
      : super(
          value: 0,
          localeValueToCompare: null,
        ) {}
}

class GreaterOrEqualToDouble_ValueIsSmallerThanValueToCompare_Stub
    extends _GreaterOrEqualToDoubleStub {
  GreaterOrEqualToDouble_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 0,
          localeValueToCompare: 1,
        ) {}
}

/* Remote parameters are provided */
class GreaterOrEqualToDouble_remoteValueToCompareIsProvided_Stub
    extends _GreaterOrEqualToDoubleStub {
  GreaterOrEqualToDouble_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 1,
          remoteValueToCompare: 1,
          localeValueToCompare: 0,
        ) {}
}

/* Exceptions on parameters */
