import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class FormState extends FormStateBase {
  FormState({
    @required FormBuilder formBuilder,
  })  : assert(formBuilder != null, 'Form builder must be provided.'),
        assert(formBuilder.isInitialized == false,
            'Form builder must not be initialized when the form state is created.'),
        assert(formBuilder.isAttachedToFormState == false,
            'Form builder must not be attached when the form state is created.'),
        super(formBuilder) {
    this._initialize(formBuilder);
  }

  void _initialize(FormBuilder formBuilder) {
    assert(formBuilder != null, 'Form builder must be provided.');
    assert(formBuilder.isInitialized == false,
        'Form builder must not be initialized when calling attach method.');
    assert(formBuilder.isAttachedToFormState == false,
        'Form builder must not be attached when calling attach method.');

    print('Attaching form builder to form state.');

    this.formBuilder = formBuilder;

    // intialize form builder (provide form group parent for each abstract control).
    // attach form builder to form state.
    formBuilder.initialize(this);
  }

  Future _validateFormGroup(FormGroup formGroup) async {
    print('Validating form group "${formGroup.listenerName}".');

    await formGroup.validate();

    for (MapEntry<String, AbstractControl> control
        in formGroup.controls.entries) {
      if (control.value is ModelFormGroup)
        await this._validateFormGroup(control.value);
      if (control.value is ModelFormArray)
        await this._validateFormArray(control.value);
      if (control.value is ModelFormControl)
        await this._validateFormControl(control.value);
    }
  }

  Future _validateFormArray(FormArray formArray) async {
    print('Validating form group "${formArray.listenerName}".');

    await formArray.validate();

    for (FormGroupBase formGroup in formArray.groups)
      await _validateFormGroup(formGroup);
  }

  Future _validateFormControl(FormControl formControl) async {
    print('Validating form group "${formControl.listenerName}".');

    await formControl.validate();
  }

  // public methods
  Future<bool> validateForm() async {
    print('Validating form from user.');

    for (MapEntry<String, AbstractControl> control
        in this.formBuilder.group.controls.entries) {
      if (control.value is FormGroup)
        await this._validateFormGroup(control.value);
      if (control.value is FormArray)
        await this._validateFormArray(control.value);
      if (control.value is FormControl)
        await this._validateFormControl(control.value);
    }

    if (this.status == EFormStatus.valid)
      print('Form is valid');
    else
      print('Form is invalid');

    return this.status == EFormStatus.valid;
  }

  ValidationError getValidationError(AbstractControl control, String property) {
    assert(control != null, '');
    assert(
        control is FormGroup || control is FormArray || control is FormControl,
        '');
    assert(property != null, '');
    assert(property != '', '');

    String listenerName = null;
    listenerName = (control is FormGroup) ? control.listenerName : listenerName;
    listenerName = (control is FormArray) ? control.listenerName : listenerName;
    listenerName =
        (control is FormControl) ? control.listenerName : listenerName;

    if (!super.errors.containsKey(listenerName))
      throw new Exception('Form property error not found');
    ValidationError error = super.errors[listenerName];
    return error;
  }
}
