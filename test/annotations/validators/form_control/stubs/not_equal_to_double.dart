import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _NotEqualToDoubleStub
    extends ValidatorStub<FormControl<double>, NotEqualToDouble> {
  _NotEqualToDoubleStub({
    double value,
    double remoteValueToCompare,
    String remoteValueToCompareName,
    double localValueToCompare,
  }) {
    FormControl<double> _value = new FormControl<double>(
      value: value,
      validators: [],
    );
    FormControl<double> _valueToCompare = new FormControl<double>(
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
    super.validator = NotEqualToDouble(
      valueToCompare: localValueToCompare,
      remoteValueToCompare: remoteValueToCompareName,
      error: null,
    );
  }
}

/* Value is valid */
class NotEqualToDouble_ValueIsSmallerThanValueToCompare_Stub
    extends _NotEqualToDoubleStub {
  NotEqualToDouble_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 1,
        ) {}
}

class NotEqualToDouble_ValueIsGreaterThanValueToCompare_Stub
    extends _NotEqualToDoubleStub {
  NotEqualToDouble_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          value: 1,
          localValueToCompare: 0,
        ) {}
}

class NotEqualToDouble_ValueAndValueToCompareAreNull_Stub
    extends _NotEqualToDoubleStub {
  NotEqualToDouble_ValueAndValueToCompareAreNull_Stub()
      : super(
          value: null,
          localValueToCompare: null,
        ) {}
}

/* Value is not valid */
class NotEqualToDouble_ValueIsNull_Stub extends _NotEqualToDoubleStub {
  NotEqualToDouble_ValueIsNull_Stub()
      : super(
          value: null,
          localValueToCompare: 0,
        ) {}
}

class NotEqualToDouble_ValueToCompareIsNull_Stub extends _NotEqualToDoubleStub {
  NotEqualToDouble_ValueToCompareIsNull_Stub()
      : super(
          value: 0,
          localValueToCompare: null,
        ) {}
}

class NotEqualToDouble_ValueIsEqualToValueToCompare_Stub
    extends _NotEqualToDoubleStub {
  NotEqualToDouble_ValueIsEqualToValueToCompare_Stub()
      : super(
          value: 0,
          localValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class NotEqualToDouble_remoteValueToCompareIsProvided_Stub
    extends _NotEqualToDoubleStub {
  NotEqualToDouble_remoteValueToCompareIsProvided_Stub()
      : super(
          value: 0,
          remoteValueToCompare: 1,
          remoteValueToCompareName: 'valueToCompare',
          localValueToCompare: 0,
        ) {}
}

/* Exceptions */
