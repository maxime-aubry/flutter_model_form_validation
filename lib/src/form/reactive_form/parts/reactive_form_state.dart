import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
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
  bool isInitialized;

  /* Protected properties */
  ReactiveFormBuilder formBuilder;

  /* Private properties */
  EFormStatus _status;
  GlobalKey<FormState> _formKey;
  // Map<String, EAbstractControlStatus> _statuses;
  // Map<String, ValidationError> _errors;

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
  ReactiveFormState({@required this.formBuilder}) {
    if (formBuilder == null)
      throw new Exception(
          'Cannot instanciate ReactiveFormState because FormBuilder is not provided.');

    this.formBuilder = formBuilder;
    this._status = EFormStatus.pure;
    this.isInitialized = false;
  }

  /* Public methods */
  void initialize() {
    if (this.isInitialized)
      throw new Exception(
          'Cannot initialize an already initialized ReactiveFormState.');

    if (!LibraryInitializer.isInitialized)
      throw new Exception(
          'flutter_model_form_validation library is not initialized. Please, call LibraryInitializer.initialize(String libraryName) method.');

    if (this.formBuilder == null)
      throw new Exception(
          'Cannot initialize ReactiveFormState if ReactiveFormBuilder is not provided.');

    // intialize form builder (provide form group parent for each abstract control).
    // attach form builder to form state.
    formBuilder.initialize(this);
    this.isInitialized = true;
  }

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

  EAbstractControlStatus getStatus(String name) {
    if (name == null || name.isEmpty)
      throw new Exception(
          'Cannot get a form control status if control name is not provided.');

    if (!this._errors.containsKey(name)) return null;

    EAbstractControlStatus status = this._statuses[name];
    return status;
  }

  ValidationError getError(String name) {
    if (name == null || name.isEmpty)
      throw new Exception(
          'Cannot get a form control status if control name is not provided.');

    if (!this._errors.containsKey(name)) return null;

    ValidationError error = this._errors[name];
    return error;
  }

  String getErrorMessage(String name) => this.getError(name)?.message;

  /* Proptected methods */

  /* Private methods */
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
