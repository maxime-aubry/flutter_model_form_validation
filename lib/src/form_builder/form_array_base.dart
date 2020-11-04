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

  // public properties
  @protected
  List<FormGroupBase> _groups;

  // getters
  UnmodifiableListView<FormGroupBase> get groups {
    UnmodifiableListView<FormGroupBase> value =
        UnmodifiableListView<FormGroupBase>(this._groups);
    return value;
  }

  String get formPath {
    return this.getFormPath(parts: new List<String>());
  }

  String get modelPath {
    return this.getModelPath(parts: new List<String>());
  }

  // public methods
  @protected
  void initializeGroups() {
    this._groups = new List<FormGroupBase>();
  }

  void addGroup(FormGroupBase formGroup) {
    assert(formGroup != null, '');
    assert(!this._groups.contains(formGroup), '');

    this._groups.add(formGroup);
  }

  void removeGroup(FormGroupBase formGroup) {
    assert(formGroup != null, '');
    assert(this._groups.contains(formGroup), '');

    this._groups.remove(formGroup);
  }

  String getFormPath({
    List<String> parts,
  }) {
    parts.insert(0, 'controls[\'${this.name}\']');
    return this.parentGroup.getFormPath(parts: parts);
  }

  String getModelPath({
    List<String> parts,
  }) {
    parts.insert(0, this.name);
    return this.parentGroup.getModelPath(parts: parts);
  }
}
