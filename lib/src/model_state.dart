import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';
import 'package:queries/collections.dart';

enum EFormStatus {
  pure,
  valid,
  invalid,
}

class ModelState<TModel extends ModelForm> {
  ModelState(TModel model) : assert(model != null) {
    this.model = model;
    this.status = EFormStatus.pure;
    this._formControlStates = new Map<String, AbstractControlState>();
    this._init();
  }

  // private properties
  Map<String, AbstractControlState> _formControlStates;

  // public properties
  TModel model;
  EFormStatus status;
  FormBuilder formBuilder;

  // private methods
  void _init() {
    this.formBuilder = new FormBuilder<TModel>(this);
  }

  Future _validateFormGroup(FormGroup formGroup) async {
    print('Validating form group "${formGroup.getListenerName()}".');

    await formGroup.validate(
      formGroup.modelState,
      formGroup.name,
      formGroup.current,
    );

    for (MapEntry<String, AbstractControl> control
        in formGroup.controls.entries) {
      if (control.value is FormGroup)
        await this._validateFormGroup(control.value);
      if (control.value is FormArray)
        await this._validateFormArray(control.value);
      if (control.value is FormControl)
        await this._validateFormControl(control.value);
    }
  }

  Future _validateFormArray(FormArray formArray) async {
    print('Validating form group "${formArray.getListenerName()}".');

    await formArray.validate(
      formArray.modelState,
      formArray.name,
      formArray.items,
    );

    for (FormGroup formGroup in formArray.groups)
      await _validateFormGroup(formGroup);
  }

  Future _validateFormControl(FormControl formControl) async {
    print('Validating form group "${formControl.getListenerName()}".');

    await formControl.validate(
      formControl.modelState,
      formControl.name,
      formControl.value,
    );
  }

  bool _actualizeModelState() {
    bool isValid = !Dictionary.fromMap(this._formControlStates)
        .where((arg1) =>
            arg1.value != null &&
            arg1.value.status == EAbstractControlStatus.invalid)
        .any();
    this.status = isValid ? EFormStatus.valid : EFormStatus.invalid;
    return isValid;
  }

  // public methods
  void actualizeAbstractControlState(
    String key,
    ValidationError error,
    EAbstractControlStatus status,
  ) {
    print('Actualizing form element "$key" with status "$status".');

    this._formControlStates[key] = new AbstractControlState(
      key,
      error,
      status,
    );
    this._actualizeModelState();
    // this.model.notifyModelState('formControlStates');
    // this.model.notifyModelState('status');
  }

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

  ValidationError getValidationError(ModelForm value, String property) {
    String listenerName = value.getListenerName(property);
    if (!this._formControlStates.containsKey(listenerName))
      throw new Exception('Form property status not found');
    ValidationError error = this._formControlStates[listenerName].error;
    return error;
  }
}
