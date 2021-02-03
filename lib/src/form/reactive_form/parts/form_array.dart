import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class FormArray extends AbstractControl {
  FormArray({
    @required List<FormGroup> groups,
    @required List<FormValidatorAnnotation> validators,
  }) : super(validators) {
    this.groups = groups ?? [];
  }

  List<FormGroup> groups;

  String get formPath {
    String part =
        (this.parentGroup != null) ? '${this.parentGroup.formPath}' : null;
    part += '.controls[\'${this.name}\']';
    return part;
  }

  String get modelPath {
    String part =
        (this.parentGroup != null) ? '${this.parentGroup.modelPath}' : null;
    part += '.${this.name}';
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

    super.name = name;
    super.parentGroup = parentGroup;
    super.isInitialized = true;
  }

  @protected
  void addGroup(FormGroup formGroup) {
    assert(formGroup != null, 'Cannot add form group if this one is null.');
    assert(!this.groups.contains(formGroup),
        'Cannot add form group if this one is already added.');

    this._addItem(formGroup);
    super.notifyListeners();
  }

  @protected
  void removeGroup(FormGroup formGroup) {
    assert(formGroup != null, 'Cannot add form group if this one is null.');
    assert(this.groups.contains(formGroup),
        'Cannot remove form group if this one is not added.');

    this._removeItem(formGroup);
    this.reindexFormArrayItems();
    super.notifyListeners();
  }

  Future validate() async =>
      await super.validateControl(this.groups, this.formPath, this.modelPath);

  /* Private methods */
  void _addItem(FormGroup formGroup) => this.groups.add(formGroup);

  void _removeItem(FormGroup formGroup) => this.groups.remove(formGroup);

  void _reindexFormArrayItem(FormGroup formGroup) {
    assert(formGroup.isArrayItem, 'Cannot reindex a non form array intem.');

    String name = formGroup.name.split('[')[0];
    FormArray formArray = formGroup.parentGroup.controls[name] as FormArray;
    int index = formArray.groups.indexOf(formGroup);
    formGroup.name = '$name[$index]';
    formGroup.notifyListeners();
  }

  /* Protected methods */
  @protected
  void reindexFormArrayItems() {
    for (FormGroup group in this.groups) this._reindexFormArrayItem(group);
  }
}
