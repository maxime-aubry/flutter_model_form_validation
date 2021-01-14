import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormArray extends AbstractControl {
  FormArray({
    @required List<FormValidatorAnnotation> validators,
    @required List<FormGroup> groups,
  }) : super(validators) {
    this._groups = groups ?? [];
  }

  List<FormGroup> _groups;

  UnmodifiableListView<FormGroup> get groups =>
      UnmodifiableListView<FormGroup>(this._groups);

  String get formPath {
    String part =
        (this.parentGroup != null) ? '${this.parentGroup.formPath}' : null;
    part += '.controls[\'${this.controlName}\']';
    return part;
  }

  String get modelPath {
    String part =
        (this.parentGroup != null) ? '${this.parentGroup.modelPath}' : null;
    part += '.${this.controlName}';
    return part;
  }

  void initialize(
    String name,
    FormGroup parentGroup,
  ) {
    assert(name != null && !name.isEmpty,
        'Cannot initialize form array if its name is not provided.');
    assert(parentGroup != null,
        'Cannot initialize form array if its parent form group is not provided.');
    assert(!super.isInitialized,
        'Cannot initialize form group if this one is already initialized.');

    super.controlName = name;
    super.parentGroup = parentGroup;

    FormBuilder formBuilder = this.getFormBuilder();
    formBuilder.formState.update(
      super.fullname,
      null,
      super.validation_status,
    );

    super.isInitialized = true;
  }

  @protected
  void addGroup(FormGroup formGroup) {
    assert(formGroup != null, 'Cannot add form group if this one is null.');
    assert(!this._groups.contains(formGroup),
        'Cannot add form group if this one is already added.');

    this._groups.add(formGroup);
  }

  @protected
  void removeGroup(FormGroup formGroup) {
    assert(formGroup != null, 'Cannot add form group if this one is null.');
    assert(this._groups.contains(formGroup),
        'Cannot remove form group if this one is not added.');

    this._groups.remove(formGroup);
  }

  Future validate() async =>
      await super.validateControl(this.groups, this.formPath, this.modelPath);
}
