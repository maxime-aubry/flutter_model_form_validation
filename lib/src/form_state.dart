import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';
import 'package:queries/collections.dart';

enum EFormStatus {
  pure,
  valid,
  invalid,
}

class FormStateBase {
  FormStateBase({
    @required FormBuilder formBuilder,
  }) : assert(formBuilder != null,
            'Cannot instanciate a form state if form builder is not provided.') {
    this._status = EFormStatus.pure;
    this._statuses = new Map<String, EAbstractControlStatus>();
    this._errors = new Map<String, ValidationError>();
    this.initialize(formBuilder);
  }

  FormStateBase.modelFormState() {
    this._status = EFormStatus.pure;
    this._statuses = new Map<String, EAbstractControlStatus>();
    this._errors = new Map<String, ValidationError>();
  }

  FormBuilder formBuilder;
  Map<String, EAbstractControlStatus> _statuses;
  Map<String, ValidationError> _errors;
  EFormStatus _status;

  EFormStatus get status => this._status;

  void initialize(FormBuilder formBuilder) {
    this.formBuilder = formBuilder;

    // intialize form builder (provide form group parent for each abstract control).
    // attach form builder to form state.
    formBuilder.initialize(this);
  }

  Future _validateFormGroup(FormGroup formGroup) async {
    await formGroup.validate();

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
    await formArray.validate();

    for (FormGroup formGroup in formArray.groups)
      await _validateFormGroup(formGroup);
  }

  Future _validateFormControl(FormControl formControl) async {
    await formControl.validate();
  }

  Future<bool> validateForm() async {
    for (MapEntry<String, AbstractControl> control
        in this.formBuilder.group.controls.entries) {
      if (control.value is FormGroup)
        await this._validateFormGroup(control.value);
      if (control.value is FormArray)
        await this._validateFormArray(control.value);
      if (control.value is FormControl)
        await this._validateFormControl(control.value);
    }

    return this.status == EFormStatus.valid;
  }

  bool _actualizeFormState() {
    bool isValid = !Dictionary.fromMap(this._statuses)
        .where((arg1) =>
            arg1.value != null && arg1.value == EAbstractControlStatus.invalid)
        .any();
    this._status = isValid ? EFormStatus.valid : EFormStatus.invalid;
    return isValid;
  }

  void update(
    String key,
    ValidationError error,
    EAbstractControlStatus status,
  ) {
    this._statuses[key] = status;
    this._errors[key] = error;
    this._actualizeFormState();
  }

  ValidationError getError(String name) {
    if (name == null || name.isEmpty)
      throw new Exception(
          'Cannot get a form control status if control name is not provided.');

    if (!this._errors.containsKey(name)) return null;

    ValidationError error = this._errors[name];
    return error;
  }

  String getErrorMessage(String name) {
    ValidationError error = this.getError(name);
    return error?.message;
  }

  EAbstractControlStatus getStatus(String name) {
    if (name == null || name.isEmpty)
      throw new Exception(
          'Cannot get a form control status if control name is not provided.');

    if (!this._errors.containsKey(name)) return null;

    EAbstractControlStatus status = this._statuses[name];
    return status;
  }
}
