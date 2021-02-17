import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../stubs.dart';

class _RequiredFormControlStub
    extends ValidatorStub<FormControl<String>, Required> {
  _RequiredFormControlStub({
    String fcValue,
  }) {
    this.control = new FormControl<String>(
      value: fcValue,
      validators: [],
    );
    this.validator = Required(error: '');
  }
}

/* Value is valid */
class RequiredFormControl_FormControlValueIsValid_Stub
    extends _RequiredFormControlStub {
  RequiredFormControl_FormControlValueIsValid_Stub() : super(fcValue: 'azerty');
}

/* Value is not valid */
class RequiredFormControl_FormControlValueIsNull_Stub
    extends _RequiredFormControlStub {
  RequiredFormControl_FormControlValueIsNull_Stub() : super(fcValue: null);
}

class RequiredFormControl_FormControlValueIsEmpty_Stub
    extends _RequiredFormControlStub {
  RequiredFormControl_FormControlValueIsEmpty_Stub() : super(fcValue: '');
}

/* Remote parameters are provided */

/* Exceptions on parameters */
