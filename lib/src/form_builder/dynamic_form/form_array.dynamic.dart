import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormArray extends FormArrayBase with DynamicFormValidator {
  FormArray({
    @required List<FormGroup> groups,
    @required List<FormValidatorAnnotation> validators,
  }) : super('', null, groups) {
    this.status = EAbstractControlStatus.pure;
    this.validators = validators ?? new List<FormValidatorAnnotation>();
    this._initialize();
  }

  void _initialize() {
    if (this.parentGroup != null && this.parentGroup is FormGroup)
      super.initialize(this.parentGroup, this.name);
  }

  Future addItem(FormGroup item) async {
    assert(item != null);
    assert(!this.groups.contains(item));

    // add form group in the list
    if (this.groups == null) this.groups = new List<FormGroup>();
    this.groups.add(item);

    // validate list of form groups
    await super.validate(
      this.formState,
      parentGroup,
      this.name,
      this.groups,
      this.formPath,
      this.modelPath,
    );
  }

  Future removeItem(FormGroup item) async {
    assert(item != null);
    assert(this.groups.contains(item));

    // remove form group from the list
    if (this.groups == null) this.groups = new List<FormGroup>();
    this.groups.remove(item);

    // validate list of form groups
    await super.validate(
      this.formState,
      parentGroup,
      this.name,
      this.groups,
      this.formPath,
      this.modelPath,
    );
  }
}
