import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class FormArray extends FormArrayBase with DynamicFormValidator {
  FormArray({
    @required List<FormGroup> groups,
    @required List<FormValidatorAnnotation> validators,
  }) : super('', null, groups) {
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

  Future addItem(FormGroup item) async {
    assert(item != null);
    assert(!this.groups.contains(item));

    // add form group in the list
    if (this.groups == null) this.initializeGroups();
    this.addGroup(item);

    // validate list of form groups
    await this.validate();
  }

  Future removeItem(FormGroup item) async {
    assert(item != null);
    assert(this.groups.contains(item));

    // remove form group from the list
    if (this.groups == null) this.initializeGroups();
    this.removeGroup(item);

    // validate list of form groups
    await this.validate();
  }

  Future validate() async => await super.validate$1(
        this.parentGroup as FormGroup,
        this.name,
        this.groups,
        this.formPath,
        this.modelPath,
      );
}
