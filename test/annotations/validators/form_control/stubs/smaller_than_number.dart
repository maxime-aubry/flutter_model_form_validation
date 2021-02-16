import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _SmallerThanNumberStub
    extends IStub<FormControl<num>, SmallerThanNumber> {
  _SmallerThanNumberStub({
    num fcValue,
    num fcValueToCompare,
    num validatorValueToCompare,
  }) {
    FormControl<num> _value = new FormControl<num>(
      value: fcValue,
      validators: [],
    );
    FormControl<num> _valueToCompare = new FormControl<num>(
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
    super.validator = SmallerThanNumber(
      valueToCompare: validatorValueToCompare,
      valueToCompareOnProperty:
          (fcValueToCompare != null) ? 'valueToCompare' : null,
      error: 'invalid date',
    );
  }
}

/* Value is valid */
class SmallerThanNumber_ValueIsSmallerThanValueToCompare_Stub
    extends _SmallerThanNumberStub {
  SmallerThanNumber_ValueIsSmallerThanValueToCompare_Stub()
      : super(
          fcValue: 0,
          validatorValueToCompare: 1,
        ) {}
}

class SmallerThanNumber_ValueIsNull_Stub extends _SmallerThanNumberStub {
  SmallerThanNumber_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorValueToCompare: 0,
        ) {}
}

/* Value is not valid */
class SmallerThanNumber_ValueIsGreaterThanValueToCompare_Stub
    extends _SmallerThanNumberStub {
  SmallerThanNumber_ValueIsGreaterThanValueToCompare_Stub()
      : super(
          fcValue: 1,
          validatorValueToCompare: 0,
        ) {}
}

/* Remote parameters are provided */
class SmallerThanNumber_ValueToCompareOnPropertyIsProvided_Stub
    extends _SmallerThanNumberStub {
  SmallerThanNumber_ValueToCompareOnPropertyIsProvided_Stub()
      : super(
          fcValue: 0,
          fcValueToCompare: 0,
          validatorValueToCompare: 1,
        ) {}
}

/* Exceptions on parameters */
class SmallerThanNumber_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
    extends _SmallerThanNumberStub {
  SmallerThanNumber_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub()
      : super(fcValue: 1) {}
}
