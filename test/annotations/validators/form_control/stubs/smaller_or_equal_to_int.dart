import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _SmallerOrEqualToIntStub
    extends IStub<FormControl<int>, SmallerOrEqualToInt> {
  _SmallerOrEqualToIntStub({
    int fcValue,
    int fcValueToCompare,
    int validatorValueToCompare,
  }) {
    FormControl<int> _value = new FormControl<int>(
      value: fcValue,
      validators: [],
    );
    FormControl<int> _valueToCompare = new FormControl<int>(
      value: fcValueToCompare,
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
    super.validator = SmallerOrEqualToInt(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class SmallerOrEqualToInt_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerOrEqualToIntStub {
  SmallerOrEqualToInt_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 1,
        ) {}
}

class SmallerOrEqualToInt_ValueEqualsValueToCompare_Stub
    extends _SmallerOrEqualToIntStub {
  SmallerOrEqualToInt_ValueEqualsValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 0,
        ) {}
}

class SmallerOrEqualToInt_NullValue_Stub extends _SmallerOrEqualToIntStub {
  SmallerOrEqualToInt_NullValue_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class SmallerOrEqualToInt_ValueIsGreterThanValueToCompare_Stub
    extends _SmallerOrEqualToIntStub {
  SmallerOrEqualToInt_ValueIsGreterThanValueToCompare_Stub()
      : super(
          fcValue: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class SmallerOrEqualToInt_ValueToCompareOnPropertyIsProvided_Stub
    extends _SmallerOrEqualToIntStub {
  SmallerOrEqualToInt_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 0,
          fcValueToCompare: 0,
          validatorValueToCompare: 1,
        ) {}
}

/* None parameter is provided */
class SmallerOrEqualToInt_ValueToCompareIsNotProvided_Stub
    extends _SmallerOrEqualToIntStub {
  SmallerOrEqualToInt_ValueToCompareIsNotProvided_Stub() : super(fcValue: 1) {}
}
