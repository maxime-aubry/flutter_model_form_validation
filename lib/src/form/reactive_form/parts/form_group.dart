import 'package:flutter/foundation.dart';

import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class FormGroup extends AbstractControl {
  /* Public properties */
  bool isArrayItem;
  Map<String, AbstractControl> controls;

  /* Protected properties */

  /* Private properties */

  /* Getters */
  String get formPath {
    String part =
        (this.parentGroup != null) ? '${this.parentGroup.formPath}' : 'root';

    if (this.parentGroup != null) {
      String key = this.name.split('[')[0];
      if (this.isArrayItem && this.parentGroup.controls[key] is FormArray) {
        FormArray formArray = this.parentGroup.controls[key] as FormArray;
        int index = formArray.groups.indexOf(this);
        part += '.controls[\'$key\'].groups[$index]';
      } else {
        part += '.controls[\'${this.name}\']';
      }
    }

    return part;
  }

  String get modelPath {
    String part =
        (this.parentGroup != null) ? '${this.parentGroup.modelPath}' : 'root';

    if (this.parentGroup != null) {
      if (this.isArrayItem &&
          this.parentGroup.controls[this.name] is FormArray) {
        FormArray formArray = this.parentGroup.controls[this.name] as FormArray;
        int index = formArray.groups.indexOf(this);
        part += '.${this.name}[$index]';
      } else {
        part += '.${this.name}';
      }
    }

    return part;
  }

  /* Setters */

  /* Constructors */
  FormGroup({
    @required Map<String, AbstractControl> controls,
    @required List<FormValidatorAnnotation> validators,
  }) : super(validators) {
    this.controls = controls ?? new Map<String, AbstractControl>();
  }

  /* Public methods */
  void initialize(
    String name,
    FormGroup parentGroup,
    bool isArrayItem,
    ReactiveFormState formState,
  ) {
    if (name == null || name.isEmpty)
      throw new FormBuilderException(
          'Cannot initialize FormGroup if its name is not provided.');

    if (this.isInitialized)
      throw new FormBuilderException(
          'Cannot initialize an already initialized FormGroup.');

    super.name = name;
    super.parentGroup = parentGroup;
    super.formState = formState;
    super.index();
    this.isArrayItem = isArrayItem;
    this._initializeControls();
    super.isInitialized = true;
  }

  bool containsControl(
    String name,
  ) {
    assert(name != null && !name.isEmpty,
        'Cannot check if control does exist if its name is not provided.');

    bool hasKey = this.controls.containsKey(name);
    return hasKey;
  }

  /// Add abstract control into this form group.
  /// And then, force the reinitialization of the form builder to update the tree.
  /// Notify listeners.
  void addControl(String name, AbstractControl control) {
    assert(name != null && !name.isEmpty,
        'Cannot add control if its name is not provided.');
    assert(control != null, 'Cannot add control if this one is null.');
    assert(!this.controls.containsKey(name),
        'Cannot add control if this one is already added.');

    this.controls[name] = control;
    this._initializeControl(name, control);
    super.notifyListeners();
  }

  /// Remove abstract control from this form group.
  /// Notify listeners.
  /// Remove listeners.
  void removeControl(
    String name,
  ) {
    assert(name != null && !name.isEmpty,
        'Cannot add control if its name is not provided.');
    assert(this.controls.containsKey(name),
        'Cannot add control if this one is not added.');

    this.controls.remove(name);
    super.notifyListeners();
  }

  // FormGroup clone(FormGroup clonedParent) {
  //   FormGroup clone = new FormGroup(
  //     formBuilder: this.formBuilder,
  //     controls: {},
  //     validators: this.validators,
  //   );

  //   clone.initialize(super.name, clonedParent, this.isArrayItem);
  //   clone.error = super.error?.copyWith();
  //   this._cloneControls(clone);
  //   return clone;
  // }

  FormGroup getFormGroup(String name) {
    if (!this.containsControl(name))
      throw new FormBuilderException('Form group not found.');

    if (this.controls[name] is! FormGroup)
      throw new FormBuilderException('Control is not of type FormGroup.');

    FormGroup formGroup = this.controls[name] as FormGroup;
    return formGroup;
  }

  FormArray getFormArray(String name) {
    if (!this.containsControl(name))
      throw new FormBuilderException('Form array not found.');

    if (this.controls[name] is! FormArray)
      throw new FormBuilderException('Control is not of type FormArray.');

    FormArray formArray = this.controls[name] as FormArray;
    return formArray;
  }

  FormControl<TProperty> getFormControl<TProperty>(String name) {
    if (!this.containsControl(name))
      throw new FormBuilderException('Form control not found.');

    if (this.controls[name] is! FormControl<TProperty>)
      throw new FormBuilderException(
          'Control is not of type FormControl<$TProperty>.');

    FormControl<TProperty> formControl =
        this.controls[name] as FormControl<TProperty>;
    return formControl;
  }

  Future validate() async => await super.validateControl();

  /* Protected methods */
  @protected
  void clearControls() {
    this.controls.clear();
    super.notifyListeners();
  }

  /* Private methods */
  void _initializeControls() {
    for (MapEntry<String, AbstractControl> control in this.controls.entries)
      this._initializeControl(control.key, control.value);
  }

  void _initializeControl(String name, AbstractControl control) {
    if (control is FormGroup)
      control.initialize(name, this, false, this.formState);
    if (control is FormArray) control.initialize(name, this, this.formState);
    if (control is FormControl) control.initialize(name, this, this.formState);
  }

  // void _cloneControls(FormGroup clone) {
  //   for (MapEntry<String, AbstractControl> control in this.controls.entries) {
  //     if (control.value is FormGroup) {
  //       FormGroup child = (control.value as FormGroup).clone(clone);
  //       clone.controls[control.key] = child;
  //     }

  //     if (control.value is FormArray) {
  //       FormArray child = (control.value as FormArray).clone(clone);
  //       clone.controls[control.key] = child;
  //     }

  //     if (control.value is FormControl) {
  //       FormControl child = (control.value as FormControl).clone(clone);
  //       clone.controls[control.key] = child;
  //     }
  //   }
  // }
}
