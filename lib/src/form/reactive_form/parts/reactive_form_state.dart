import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

enum EFormStatus {
  pure,
  valid,
  invalid,
}

class ReactiveFormState {
  ReactiveFormState({
    @required this.formBuilder,
    @required GlobalKey<FormState> formKey,
    bool isMultipleStepsForm = false,
  }) {
    this.formBuilder = formBuilder;
    this._formKey = formKey;
    this._isMultipleStepsForm = isMultipleStepsForm;
    this._status = EFormStatus.pure;
  }

  @protected
  ReactiveFormBuilder formBuilder;
  bool _isMultipleStepsForm;
  EFormStatus _status;
  GlobalKey<FormState> _formKey;

  EFormStatus get status => this._status;
  bool get isMultipleStepsForm => this._isMultipleStepsForm;

  void initialize() {
    // intialize form builder (provide form group parent for each abstract control).
    // attach form builder to form state.
    formBuilder.initialize(this);
  }

  Future _validateFormGroup(FormGroup formGroup) async {
    if (formGroup.isArrayItem) await formGroup.validate();

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

  Future<bool> validate() async {
    for (MapEntry<String, AbstractControl> control
        in this.formBuilder.group.controls.entries) {
      if (control.value is FormGroup)
        await this._validateFormGroup(control.value);
      if (control.value is FormArray)
        await this._validateFormArray(control.value);
      if (control.value is FormControl)
        await this._validateFormControl(control.value);
    }

    this._formKey.currentState.validate();

    return this.status == EFormStatus.valid;
  }

  // bool _actualizeFormState() {
  //   bool isValid = !Dictionary.fromMap(this._statuses)
  //       .where((arg1) =>
  //           arg1.value != null && arg1.value == EAbstractControlStatus.invalid)
  //       .any();
  //   this._status = isValid ? EFormStatus.valid : EFormStatus.invalid;
  //   return isValid;
  // }

  // void update(
  //   String key,
  //   ValidationError error,
  //   EAbstractControlStatus status,
  // ) {
  //   this._statuses[key] = status;
  //   this._errors[key] = error;
  //   this._actualizeFormState();
  // }

  // EAbstractControlStatus getStatus(String name) {
  //   if (name == null || name.isEmpty)
  //     throw new Exception(
  //         'Cannot get a form control status if control name is not provided.');

  //   if (!this._errors.containsKey(name)) return null;

  //   EAbstractControlStatus status = this._statuses[name];
  //   return status;
  // }

  // ValidationError getError(String name) {
  //   if (name == null || name.isEmpty)
  //     throw new Exception(
  //         'Cannot get a form control status if control name is not provided.');

  //   if (!this._errors.containsKey(name)) return null;

  //   ValidationError error = this._errors[name];
  //   return error;
  // }

  // String getErrorMessage(String name) {
  //   ValidationError error = this.getError(name);
  //   return error?.message;
  // }
}
