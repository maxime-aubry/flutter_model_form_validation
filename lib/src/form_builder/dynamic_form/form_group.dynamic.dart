import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormGroup extends FormGroupBase with DynamicFormValidator {
  FormGroup({
    @required Map<String, AbstractControl> controls,
    @required List<FormValidatorAnnotation> validators,
  }) : super('', null, controls, false) {
    this.validators = validators ?? new List<FormValidatorAnnotation>();
    this.controls = controls ?? new Map<String, AbstractControl>();
    this.status = EAbstractControlStatus.pure;
    this._initialize();
  }

  void _initialize() {
    if (this.parentGroup != null && this.parentGroup is FormGroup)
      super.initialize(this.parentGroup, this.name);
  }

  Future addItem(String name, AbstractControl item) async {
    assert(name != null);
    assert(name != '');
    assert(item != null);
    assert(item is FormGroup || item is FormArray || item is FormControl);
    assert(!this.controls.containsKey(name));

    // add form group in the list
    if (this.controls == null)
      this.controls = new Map<String, AbstractControl>();
    this.controls[name] = item;

    // validate all controls
    for (MapEntry<String, AbstractControl> control in this.controls.entries)
      await this.validate(
        this.formState,
        this.parentGroup,
        this.name,
        control.value,
        this.formPath,
        this.modelPath,
      );
  }

  Future removeItem(String name) async {
    assert(name != null);
    assert(name != '');
    assert(this.controls.containsKey(name));

    this.controls.remove(name);

    // validate all controls
    for (MapEntry<String, AbstractControl> control in this.controls.entries)
      await this.validate(
        this.formState,
        this.parentGroup,
        this.name,
        control.value,
        this.formPath,
        this.modelPath,
      );
  }
}
