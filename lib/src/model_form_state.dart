import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';

class ModelFormState<TModel extends ModelForm> extends FormStateBase {
  ModelFormState(TModel model)
      : assert(model != null),
        super(null) {
    this.model = model;
    this._init();
  }

  // private properties
  Map<String, AbstractControlState> _formControlStates;

  // public properties
  TModel model;
  EFormStatus status;

  // private methods
  void _init() {
    this.formBuilder = new ModelFormBuilder<TModel>(this);
  }

  Future _validateFormGroup(ModelFormGroup formGroup) async {
    print('Validating form group "${formGroup.listenerName}".');

    await formGroup.validateModelForm(
      this,
      formGroup,
      formGroup.name,
      formGroup.current,
      formGroup.formPath,
      formGroup.modelPath,
    );

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

    await formArray.validateModelForm(
      this,
      formArray.parentGroup as ModelFormGroup,
      formArray.name,
      formArray.items,
      formArray.formPath,
      formArray.modelPath,
    );

    for (FormGroupBase formGroup in formArray.groups)
      await _validateFormGroup(formGroup);
  }

  Future _validateFormControl(ModelFormControl formControl) async {
    print('Validating form group "${formControl.listenerName}".');

    await formControl.validateModelForm(
      this,
      formControl.parentGroup as ModelFormGroup,
      formControl.name,
      formControl.value,
      formControl.formPath,
      formControl.modelPath,
    );
  }

  // public methods
  Future<bool> validateForm() async {
    print('Validating form from user.');

    for (MapEntry<String, AbstractControl> control
        in this.formBuilder.group.controls.entries) {
      if (control.value is FormGroupBase)
        await this._validateFormGroup(control.value);
      if (control.value is FormArrayBase)
        await this._validateFormArray(control.value);
      if (control.value is FormControlBase)
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
    if (!this._formControlStates.containsKey(listenerName))
      throw new Exception('Form property status not found');
    ValidationError error = this._formControlStates[listenerName].error;
    return error;
  }
}
