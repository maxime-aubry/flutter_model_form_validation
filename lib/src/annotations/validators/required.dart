import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class Required extends FormValidatorAnnotation<AbstractControl> {
  const Required({
    @required String error,
  }) : super(error: error);

  @override
  Future<bool> isValid(AbstractControl control) async {
    if (control is FormGroup)
      return this._validateFormGroup(control);
    if (control is FormArray)
      return this._validateFormArray(control);
    if (control is FormControl) return this._validateFormControl(control);
    return false;
  }

  bool _validateFormGroup(FormGroup formGroup) => (formGroup.controls.length > 0);

  bool _validateFormArray(FormArray formArray) => (formArray.groups.length > 0);

  bool _validateFormControl(FormControl formControl) {
    if (formControl.value == null) return false;
    if (formControl.value is String && formControl.value.isEmpty) return false;
    return true;
  }
}
