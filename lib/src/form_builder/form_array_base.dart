import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormArrayBase extends AbstractControl {
  FormArrayBase(
    String name,
    FormGroupBase parentGroup,
    List<FormGroupBase> groups,
  )   : assert(name != null),
        super(name, parentGroup) {
    this._groups = groups ?? new List<FormGroupBase>();
  }

  @protected
  List<FormGroupBase> _groups;

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

  UnmodifiableListView<FormGroupBase> get groups =>
      UnmodifiableListView<FormGroupBase>(this._groups);

  @protected
  void initializeGroups() {
    this._groups = new List<FormGroupBase>();
  }

  @protected
  void addGroup(FormGroupBase formGroup) {
    assert(formGroup != null, '');
    assert(!this._groups.contains(formGroup), '');

    this._groups.add(formGroup);
  }

  @protected
  void removeGroup(FormGroupBase formGroup) {
    assert(formGroup != null, '');
    assert(this._groups.contains(formGroup), '');

    this._groups.remove(formGroup);
  }
}
