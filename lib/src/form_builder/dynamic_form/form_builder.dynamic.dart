import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormBuilder extends FormBuilderBase {
  FormBuilder({
    @required FormGroup group,
  }) : super(group) {
    this._isInitialized = false;
  }

  // private properties
  bool _isInitialized;

  // getters
  bool get isInitialized => this._isInitialized;

  void initialize() {
    this._initializeFormGroup(this.group, null, 'root');
    this._isInitialized = true;
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
