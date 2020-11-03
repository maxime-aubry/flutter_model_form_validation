import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class FormState extends FormStateBase {
  FormState({
    @required FormBuilder formBuilder,
  })  : assert(formBuilder != null, 'Form builder must be provided.'),
        assert(formBuilder.isInitialized == false,
            'Form builder must be initialized before to be attached to the form state.'),
        assert(formBuilder.isAttachedToFormState == false,
            'Form builder must not to be attached yet.'),
        super(formBuilder);

  void attach(FormBuilder formBuilder) {
    assert(formBuilder != null);

    print('Attaching form builder to form state.');

    this.formBuilder = formBuilder;

    // intialize form builder (provide form group parent for each abstract control).
    // attach form builder to form state.
    formBuilder.initialize(this);
  }

  Future _validateFormGroup(ModelFormGroup formGroup) async {}

  Future _validateFormArray(ModelFormArray formArray) async {}

  Future _validateFormControl(ModelFormControl formControl) async {}

  // public methods
  Future<bool> validateForm() async {}

  ValidationError getValidationError(ModelForm value, String property) {}
}
