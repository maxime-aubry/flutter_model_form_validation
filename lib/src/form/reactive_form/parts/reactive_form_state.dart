import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';
import 'package:queries/collections.dart';

enum EFormStatus {
  pure,
  valid,
  invalid,
}

class ReactiveFormState {
  /* Public properties */

  /* Protected properties */
  ReactiveFormBuilder formBuilder;

  /* Private properties */
  EFormStatus _status;
  GlobalKey<FormState> _formKey;

  /* Getters */
  EFormStatus get status => this._status;

  Map<String, EAbstractControlStatus> get _statuses =>
      Dictionary.fromMap(this.formBuilder.indexer)
          .toDictionary$1((arg1) => arg1.key, (arg1) => arg1.value.status)
          .toMap();

  Map<String, ValidationError> get _errors =>
      Dictionary.fromMap(this.formBuilder.indexer)
          .toDictionary$1((arg1) => arg1.key, (arg1) => arg1.value.error)
          .toMap();

  /* Setters */

  /* Constructors */
  ReactiveFormState() {
    this._status = EFormStatus.pure;
  }

  /* Public methods */
  void attachFormKey(GlobalKey<FormState> formKey) {
    this._formKey = formKey;
  }

  void update() {
    bool isValid = !Dictionary.fromMap(this._statuses)
        .where((arg1) =>
            arg1.value != null && arg1.value == EAbstractControlStatus.invalid)
        .any();
    this._status = isValid ? EFormStatus.valid : EFormStatus.invalid;
  }

  Future<bool> validate() async {
    //#region locales methods
    void validate() async {
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
    }
    //#endregion

    await validate();
    bool isValid = this.status == EFormStatus.valid;
    return isValid;
  }

  EAbstractControlStatus getStatus(String name) {
    if (name == null || name.isEmpty)
      throw new FormBuilderException(
          'Cannot get a form control status if control name is not provided.');

    if (!this._errors.containsKey(name)) return null;

    EAbstractControlStatus status = this._statuses[name];
    return status;
  }

  ValidationError getError(String name) {
    if (name == null || name.isEmpty)
      throw new FormBuilderException(
          'Cannot get a form control status if control name is not provided.');

    if (!this._errors.containsKey(name)) return null;

    ValidationError error = this._errors[name];
    return error;
  }

  String getErrorMessage(String name) => this.getError(name)?.message;

  /* Proptected methods */

  /* Private methods */
  /*Future<bool> _validateFormStep(String step) async {
    //#region locales methods
    void checkStepName() {
      if (step.isEmpty)
        throw new FormBuilderException('Step name cannot be an empty string.');
    }

    void validate() async {
      FormGroup currentStep = this.formBuilder.group.getFormGroup(step);
      await this._validateFormGroup(currentStep);
      this._formKeys[step].currentState.validate();
    }

    bool hasInvalidStepFields() =>
        Collection(this.formBuilder.indexer.values.toList())
            .where((arg1) => arg1.step == step)
            .where((arg1) => arg1.status == EAbstractControlStatus.invalid)
            .any();
    //#endregion

    checkStepName();
    await validate();
    bool isValid = !hasInvalidStepFields();
    return isValid;
  }*/

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
}
