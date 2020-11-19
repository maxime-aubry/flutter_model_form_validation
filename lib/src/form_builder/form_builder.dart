import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class FormBuilder {
  FormBuilder({
    @required FormGroup group,
  }) : assert(group != null,
            'Cannot instanciate form builder if main form group is not provided.') {
    this.group = group;
    this._isInitialized = false;
    this._isAttachedToFormState = false;
  }

  FormBuilder.modelFormBuilder() {
    this.group = null;
    this._isInitialized = false;
    this._isAttachedToFormState = false;
  }

  FormGroup group;
  FormStateBase formState;
  bool _isInitialized;
  bool _isAttachedToFormState;
  bool get isInitialized => this._isInitialized;
  bool get isAttachedToFormState => this._isAttachedToFormState;

  void initialize(FormStateBase formState) {
    assert(formState != null,
        'Cannot initialize form builder if form state is not provided.');
    assert(!this._isInitialized,
        'Cannot initialize form builder if this one is already initialized.');
    assert(!this._isAttachedToFormState,
        'Cannot attach form builder to form styate if this one is already attached.');

    this.formState = formState;
    this.group.formBuilder = this;
    this._initializeFormGroup(this.group, null, 'root');
    this._isInitialized = true;
    this._isAttachedToFormState = true;
  }

  void _initializeFormGroup(
    FormGroup current,
    FormGroup parentGroup,
    String name, [
    bool isArrayItem = false,
  ]) {
    current.initialize(name, parentGroup, isArrayItem);

    for (MapEntry<String, AbstractControl> child in current.controls.entries) {
      if (child.value is FormGroup) {
        this._initializeFormGroup(
          child.value as FormGroup,
          current,
          child.key,
        );
      }
      if (child.value is FormArray) {
        this._initializeFormArray(
          child.value as FormArray,
          current,
          child.key,
        );
      }
      if (child.value is FormControl) {
        this._initializeFormControl(
          child.value as FormControl,
          current,
          child.key,
        );
      }
    }
  }

  void _initializeFormArray(
    FormArray formArray,
    FormGroup parentGroup,
    String name,
  ) {
    formArray.initialize(name, parentGroup);

    for (FormGroup formGroup in formArray.groups)
      this._initializeFormGroup(
        formGroup,
        parentGroup,
        '$name[${formArray.groups.indexOf(formGroup)}]',
        true,
      );
  }

  void _initializeFormControl(
    FormControl formControl,
    FormGroup parentGroup,
    String name,
  ) {
    formControl.initialize(name, parentGroup);
  }
}
