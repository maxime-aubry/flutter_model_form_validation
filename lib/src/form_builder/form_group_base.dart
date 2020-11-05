import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormGroupBase extends AbstractControl {
  FormGroupBase(
    String name,
    FormGroupBase parentGroup,
    Map<String, AbstractControl> controls,
    bool isArrayitem,
  ) : super(name, parentGroup) {
    this._controls = controls ?? new Map<String, AbstractControl>();
    this.isArrayItem = isArrayitem;
  }

  bool isArrayItem;

  Map<String, AbstractControl> _controls;

  UnmodifiableMapView<String, AbstractControl> get controls {
    UnmodifiableMapView<String, AbstractControl> value =
        UnmodifiableMapView<String, AbstractControl>(this._controls);
    return value;
  }

  String get formPath {
    String part =
        (this.parentGroup != null) ? '${this.parentGroup.formPath}' : 'root';

    if (this.parentGroup != null) {
      if (this.isArrayItem &&
          this.parentGroup.controls[this.controlName] is FormArrayBase) {
        FormArrayBase formArray =
            this.parentGroup.controls[this.controlName] as FormArrayBase;
        int index = formArray.groups.indexOf(this);
        part += '.controls[\'${this.controlName}\'].groups[$index]';
      } else {
        part += '.controls[\'${this.controlName}\']';
      }
    }

    return part;
  }

  String get modelPath {
    String part =
        (this.parentGroup != null) ? '${this.parentGroup.modelPath}' : 'root';

    if (this.parentGroup != null) {
      if (this.isArrayItem &&
          this.parentGroup.controls[this.controlName] is FormArrayBase) {
        FormArrayBase formArray =
            this.parentGroup.controls[this.controlName] as FormArrayBase;
        int index = formArray.groups.indexOf(this);
        part += '.${this.controlName}[$index]';
      } else {
        part += '.${this.controlName}';
      }
    }

    return part;
  }

  bool containsControl(String name) {
    assert(name != null, '');
    assert(name != '', '');

    bool hasKey = this._controls.containsKey(name);
    return hasKey;
  }

  @protected
  void addControl(String name, AbstractControl control) {
    assert(name != null, '');
    assert(name != '', '');
    assert(control != null, '');
    assert(!this._controls.containsKey(name));

    this._controls[name] = control;
  }

  @protected
  void removeControl(String name) {
    assert(name != null, '');
    assert(name != '', '');
    assert(this._controls.containsKey(name), '');

    this._controls.remove(name);
  }
}
