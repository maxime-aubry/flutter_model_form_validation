import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormGroupBase extends AbstractControl {
  FormGroupBase(
    String name,
    FormGroupBase parentGroup,
    Map<String, AbstractControl> controls,
    bool isArrayitem,
  ) : super(name, parentGroup) {
    this.controls = controls ?? new Map<String, AbstractControl>();
    this._isArrayItem = isArrayitem;
  }

  // private properties
  bool _isArrayItem;

  // public properties
  @protected
  Map<String, AbstractControl> controls;

  // getters
  String get formPath {
    return this.getFormPath(parts: new List<String>());
  }

  String get modelPath {
    return this.getModelPath(parts: new List<String>());
  }

  // private methods
  bool containsControl(String name) {
    assert(name != null);
    assert(name != '');

    bool hasKey = this.controls.containsKey(name);
    return hasKey;
  }

  void addControl(String name, AbstractControl control) {
    assert(name != null);
    assert(name != '');
    assert(control != null);
    assert(!this.controls.containsKey(name));

    this.controls[name] = control;
  }

  void removeControl(String name) {
    assert(name != null);
    assert(name != '');
    assert(!this.controls.containsKey(name));

    this.controls.remove(name);
  }

  // public methods
  String getFormPath({
    List<String> parts,
  }) {
    // if there is a parent
    if (this.parentGroup != null) {
      if (this._isArrayItem &&
          this.parentGroup.controls[this.name] is FormArrayBase) {
        FormArrayBase formArray =
            this.parentGroup.controls[this.name] as FormArrayBase;
        int index = formArray.groups.indexOf(this);
        parts.insert(0, 'controls[\'${this.name}\'].groups[$index]');
      } else {
        parts.insert(0, 'controls[\'${this.name}\']');
      }
      return this.parentGroup.getFormPath(parts: parts);
    }
    // if there is no parent, it's root
    else {
      parts.insert(0, 'root');
      return parts.join('.');
    }
  }

  String getModelPath({
    List<String> parts,
  }) {
    // if there is a parent
    if (this.parentGroup != null) {
      if (this._isArrayItem &&
          this.parentGroup.controls[this.name] is FormArrayBase) {
        FormArrayBase formArray =
            this.parentGroup.controls[this.name] as FormArrayBase;
        int index = formArray.groups.indexOf(this);
        parts.insert(0, '${this.name}[$index]');
      } else {
        parts.insert(0, this.name);
      }
      return this.parentGroup.getModelPath(parts: parts);
    }
    // if there is no parent, it's root
    else {
      parts.insert(0, 'root');
      return parts.join('.');
    }
  }
}
