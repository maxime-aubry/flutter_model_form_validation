import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormGroup extends FormGroupBase with DynamicFormValidator {
  FormGroup({
    @required Map<String, AbstractControl> controls,
    @required List<FormValidatorAnnotation> validators,
  }) : super('', null, controls, false) {
    this.validators = validators ?? new List<FormValidatorAnnotation>();
    this._isInitialized = false;
  }

  bool _isInitialized;

  @override
  void initialize(String name, FormGroup parentGroup, FormState formState) {
    assert(name != null, '');
    assert(name != '', '');
    assert(parentGroup != null, '');
    assert(parentGroup is FormGroup, '');
    assert(formState != null, '');
    assert(this._isInitialized == false, '');

    this.parentGroup = parentGroup;
    super.initialize(this.name, this.parentGroup, formState);
    this._isInitialized = true;
  }

  Future addItem(String name, AbstractControl item) async {
    assert(name != null, '');
    assert(name != '', '');
    assert(item != null, '');
    assert(item is FormGroup || item is FormArray || item is FormControl, '');
    assert(!this.containsControl(name), '');

    // add form group in the list
    this.addControl(name, item);

    // validate all controls
    for (MapEntry<String, AbstractControl> control in this.controls.entries) {
      if (control.value is FormGroup)
        await (control.value as FormGroup).validate();
      if (control.value is FormArray)
        await (control.value as FormArray).validate();
      if (control.value is FormControl)
        await (control.value as FormControl).validate();
    }
  }

  Future removeItem(String name) async {
    assert(name != null, '');
    assert(name != '', '');
    assert(this.containsControl(name), '');

    this.removeControl(name);

    // validate all controls
    for (MapEntry<String, AbstractControl> control in this.controls.entries) {
      if (control.value is FormGroup)
        await (control.value as FormGroup).validate();
      if (control.value is FormArray)
        await (control.value as FormArray).validate();
      if (control.value is FormControl)
        await (control.value as FormControl).validate();
    }
  }

  Future validate() async => await super.validate$1(
        this.parentGroup as FormGroup,
        this.name,
        this,
        this.formPath,
        this.modelPath,
      );
}
