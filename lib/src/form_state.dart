import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class FormState extends FormStateBase {
  FormState({
    @required FormBuilder formBuilder,
  })  : assert(formBuilder != null, 'Form builder must be provided.'),
        assert(formBuilder.isInitialized == true,
            'Form builder must be initialized before to be attached to the form state.'),
        super(formBuilder);

  Future _validateFormGroup(ModelFormGroup formGroup) async {}

  Future _validateFormArray(ModelFormArray formArray) async {}

  Future _validateFormControl(ModelFormControl formControl) async {}

  // public methods
  Future<bool> validateForm() async {}

  ValidationError getValidationError(ModelForm value, String property) {}
}
