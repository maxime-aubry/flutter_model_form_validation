import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class Required extends FormValidatorAnnotation<AbstractControl> {
  const Required({
    @required String error,
  }) : super(error: error);

  @override
  Future<bool> isValid(AbstractControl control) async {
    if (control is FormGroup)
      return this._validateFormGroup(control.controls.length);
    if (control is FormArray)
      return this._validateFormArray(control.groups.length);
    if (control is FormControl) return this._validateFormControl(control.value);
    return false;
  }

  bool _validateFormGroup(int length) => (length > 0);

  bool _validateFormArray(int length) => (length > 0);

  bool _validateFormControl(Object value) {
    if (value == null) return false;
    if (value is String && value.isEmpty) return false;
    return true;
  }
}
