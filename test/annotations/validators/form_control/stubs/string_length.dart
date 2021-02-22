import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../../../stubs.dart';

class _StringLengthStub
    extends ValidatorStub<FormControl<String>, StringLength> {
  _StringLengthStub({
    String value,
    int localMin,
    int localMax,
  }) {
    FormControl<String> _value = new FormControl<String>(
      value: value,
      validators: [],
    );

    FormGroup _root = new FormGroup(
      controls: {
        'value': _value,
      },
      validators: [],
    );

    _value.parentGroup = _root;

    super.control = _value;
    super.validator = StringLength(
      min: localMin,
      max: localMax,
      error: null,
    );
  }
}

/* Value is valid */
class StringLength_ValueLengthIsEqualToMin_Stub extends _StringLengthStub {
  StringLength_ValueLengthIsEqualToMin_Stub()
      : super(
          value: 'H',
          localMin: 1,
          localMax: 6,
        );
}

class StringLength_ValueLengthIsEqualToMax_Stub extends _StringLengthStub {
  StringLength_ValueLengthIsEqualToMax_Stub()
      : super(
          value: 'Hello!',
          localMin: 1,
          localMax: 6,
        );
}

class StringLength_ValueLengthIsBetweenMinAndMax_Stub
    extends _StringLengthStub {
  StringLength_ValueLengthIsBetweenMinAndMax_Stub()
      : super(
          value: 'Hi!',
          localMin: 1,
          localMax: 5,
        );
}

class StringLength_ValueIsNull_Stub extends _StringLengthStub {
  StringLength_ValueIsNull_Stub()
      : super(
          value: null,
          localMin: 1,
          localMax: 5,
        );
}

/* Value is not valid */
class StringLength_ValueLengthIsSmallerThanMin_Stub extends _StringLengthStub {
  StringLength_ValueLengthIsSmallerThanMin_Stub()
      : super(
          value: 'H',
          localMin: 2,
          localMax: 6,
        );
}

class StringLength_ValueLengthIsGreaterThanMax_Stub extends _StringLengthStub {
  StringLength_ValueLengthIsGreaterThanMax_Stub()
      : super(
          value: 'Hello!',
          localMin: 1,
          localMax: 5,
        );
}

/* Remote parameters are provided */

/* Exceptions */
class StringLength_ThrowsValidatorParameterExceptionOnNullMin_Stub
    extends _StringLengthStub {
  StringLength_ThrowsValidatorParameterExceptionOnNullMin_Stub()
      : super(
          value: 'a',
          localMax: 3,
        ) {}
}

class StringLength_ThrowsValidatorParameterExceptionOnNullMax_Stub
    extends _StringLengthStub {
  StringLength_ThrowsValidatorParameterExceptionOnNullMax_Stub()
      : super(
          value: 'a',
          localMin: 1,
        ) {}
}

class StringLength_ThrowsValidatorParameterExceptionOnMinGreaterThanMax_Stub
    extends _StringLengthStub {
  StringLength_ThrowsValidatorParameterExceptionOnMinGreaterThanMax_Stub()
      : super(
          value: 'a',
          localMin: 3,
          localMax: 1,
        ) {}
}
