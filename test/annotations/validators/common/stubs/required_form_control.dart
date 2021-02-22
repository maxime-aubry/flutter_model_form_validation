import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../../../stubs.dart';

class _RequiredFormControlStub
    extends ValidatorStub<FormControl<String>, Required> {
  _RequiredFormControlStub({
    String value,
  }) {
    this.control = new FormControl<String>(
      value: value,
      validators: [],
    );
    this.validator = Required(error: '');
  }
}

/* Value is valid */
class RequiredFormControl_FormControlValueIsValid_Stub
    extends _RequiredFormControlStub {
  RequiredFormControl_FormControlValueIsValid_Stub() : super(value: 'azerty');
}

/* Value is not valid */
class RequiredFormControl_FormControlValueIsNull_Stub
    extends _RequiredFormControlStub {
  RequiredFormControl_FormControlValueIsNull_Stub() : super(value: null);
}

class RequiredFormControl_FormControlValueIsEmpty_Stub
    extends _RequiredFormControlStub {
  RequiredFormControl_FormControlValueIsEmpty_Stub() : super(value: '');
}

/* Remote parameters are provided */

/* Exceptions */
