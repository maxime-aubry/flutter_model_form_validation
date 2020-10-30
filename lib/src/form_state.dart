import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class FormState extends FormStateBase {
  FormState({
    @required FormBuilder formBuilder,
  }) : super(formBuilder) {
    this._init();
  }

  void _init() {
    this._initializeFormGroup(this.formBuilder.group, null, 'root');
  }

  void _initializeFormGroup(
    FormGroup current,
    FormGroup parent,
    String name,
  ) {
    current.parentGroup = parent;
    current.name = name;

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
    FormGroup parent,
    String name,
  ) {
    formArray.parentGroup = parent;
    formArray.name = name;

    for (FormGroup formGroup in formArray.groups)
      this._initializeFormGroup(formGroup, parent, null);
  }

  void _initializeFormControl(
    FormControl formControl,
    FormGroup parent,
    String name,
  ) {
    formControl.parentGroup = parent;
    formControl.name = name;
  }
}
