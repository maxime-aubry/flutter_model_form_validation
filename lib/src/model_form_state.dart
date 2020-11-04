import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';

class ModelFormState<TModel extends ModelForm> extends FormStateBase {
  ModelFormState(TModel model)
      : assert(model != null, 'Model must be provided.'),
        super(null) {
    this.model = model;
    this._initialize();
  }

  // public properties
  TModel model;

  // private methods
  void _initialize() {
    ModelFormBuilder<TModel> formBuilder = new ModelFormBuilder<TModel>();
    this.formBuilder = formBuilder;
    formBuilder.initialize(this);
  }

  Future _validateFormGroup(ModelFormGroup formGroup) async {
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

  Future _validateFormArray(ModelFormArray formArray) async {
    print('Validating form group "${formArray.listenerName}".');

    await formArray.validate();

    for (FormGroupBase formGroup in formArray.groups)
      await _validateFormGroup(formGroup);
  }

  Future _validateFormControl(ModelFormControl formControl) async {
    print('Validating form group "${formControl.listenerName}".');

    await formControl.validate();
  }

  // public methods
  Future<bool> validateForm() async {
    print('Validating form from user.');

    for (MapEntry<String, AbstractControl> control
        in this.formBuilder.group.controls.entries) {
      if (control.value is ModelFormGroup)
        await this._validateFormGroup(control.value);
      if (control.value is ModelFormArray)
        await this._validateFormArray(control.value);
      if (control.value is ModelFormControl)
        await this._validateFormControl(control.value);
    }

    if (this.status == EFormStatus.valid)
      print('Form is valid');
    else
      print('Form is invalid');

    return this.status == EFormStatus.valid;
  }

  ValidationError getValidationError(ModelForm value, String property) {
    String listenerName = value.getListenerName(property);
    if (!super.errors.containsKey(listenerName))
      throw new Exception('Form property error not found');
    ValidationError error = super.errors[listenerName];
    return error;
  }
}
