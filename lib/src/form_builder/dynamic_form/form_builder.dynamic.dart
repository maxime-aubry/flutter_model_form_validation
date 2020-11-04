import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormBuilder extends FormBuilderBase {
  FormBuilder({
    @required FormGroup group,
  }) : super(group) {
    this._isInitialized = false;
    this._isAttachedToFormState = false;
  }

  FormState _formState;
  bool _isInitialized;
  bool _isAttachedToFormState;
  bool get isInitialized => this._isInitialized;
  bool get isAttachedToFormState => this._isAttachedToFormState;

  void initialize(FormState formState) {
    assert(formState != null, '');
    assert(this._isInitialized == false, '');
    assert(this._isAttachedToFormState == false, '');

    this._formState = formState;
    this._initializeFormGroup(this.group, null, 'root');
    this._isInitialized = true;
  }

  void _initializeFormGroup(
    FormGroup current,
    FormGroup parentGroup,
    String name,
  ) {
    current.initialize(name, parentGroup, this._formState);

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
    formArray.initialize(name, parentGroup, this._formState);

    for (FormGroup formGroup in formArray.groups)
      this._initializeFormGroup(formGroup, parentGroup, name);
  }

  void _initializeFormControl(
    FormControl formControl,
    FormGroup parentGroup,
    String name,
  ) {
    formControl.initialize(name, parentGroup, this._formState);
  }
}
