import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class FormGroup extends AbstractControl {
  FormGroup({
    String name,
    FormGroup parentGroup,
    FormBuilder formBuilder,
    @required List<FormValidatorAnnotation> validators,
    @required Map<String, AbstractControl> controls,
  }) : super(validators) {
    this.formBuilder = formBuilder;
    this._controls = controls ?? new Map<String, AbstractControl>();
  }

  FormBuilder formBuilder;
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
      String key = this.controlName.split('[')[0];
      if (this.isArrayItem && this.parentGroup.controls[key] is FormArray) {
        FormArray formArray = this.parentGroup.controls[key] as FormArray;
        int index = formArray.groups.indexOf(this);
        part += '.controls[\'$key\'].groups[$index]1';
      } else {
        part += '.controls[\'${this.controlName}\']2';
      }
    }

    return part;
  }

  String get modelPath {
    String part =
        (this.parentGroup != null) ? '${this.parentGroup.modelPath}' : 'root';

    if (this.parentGroup != null) {
      if (this.isArrayItem &&
          this.parentGroup.controls[this.controlName] is FormArray) {
        FormArray formArray =
            this.parentGroup.controls[this.controlName] as FormArray;
        int index = formArray.groups.indexOf(this);
        part += '.${this.controlName}[$index]';
      } else {
        part += '.${this.controlName}';
      }
    }

    return part;
  }

  void initialize(
    String name,
    FormGroup parentGroup,
    bool isArrayItem,
  ) {
    assert(name != null && !name.isEmpty,
        'Cannot initialize form group if its name is not provided.');
    assert(!super.isInitialized,
        'Cannot initialize form group if this one is already initialized.');

    super.controlName = name;
    super.parentGroup = parentGroup;
    this.isArrayItem = isArrayItem;

    if (super.controlName != 'root' && super.parentGroup != null) {
      FormStateBase formState = super.getFormState();
      formState.update(
        super.fullname,
        null,
        super.status,
      );
    }

    super.isInitialized = true;
  }

  bool containsControl(
    String name,
  ) {
    assert(name != null && !name.isEmpty,
        'Cannot check if control does exist if its name is not provided.');

    bool hasKey = this._controls.containsKey(name);
    return hasKey;
  }

  @protected
  void addControl(
    String name,
    AbstractControl control,
  ) {
    assert(name != null && !name.isEmpty,
        'Cannot add control if its name is not provided.');
    assert(control != null, 'Cannot add control if this one is null.');
    assert(!this._controls.containsKey(name),
        'Cannot add control if this one is already added.');

    this._controls[name] = control;
  }

  @protected
  void removeControl(
    String name,
  ) {
    assert(name != null && !name.isEmpty,
        'Cannot add control if its name is not provided.');
    assert(this._controls.containsKey(name),
        'Cannot add control if this one is not added.');

    this._controls.remove(name);
  }

  Future validate() async =>
      await super.validateControl(this, this.formPath, this.modelPath);
}
