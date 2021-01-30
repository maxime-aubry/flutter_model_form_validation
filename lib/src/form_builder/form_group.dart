import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormGroup extends AbstractControl {
  FormGroup({
    String name,
    FormGroup parentGroup,
    FormBuilder formBuilder,
    List<FormValidatorAnnotation> validators,
    @required Map<String, AbstractControl> controls,
  }) : super(validators) {
    this.formBuilder = formBuilder;
    this.controls = controls ?? new Map<String, AbstractControl>();
  }

  FormBuilder formBuilder;
  bool isArrayItem;
  Map<String, AbstractControl> controls;

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

  void initialize(
    String name,
    FormGroup parentGroup,
    bool isArrayItem,
  ) {
    assert(name != null && !name.isEmpty,
        'Cannot initialize form group if its name is not provided.');

    super.name = name;
    super.parentGroup = parentGroup;
    this.isArrayItem = isArrayItem;
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
  void addControl(
    String name,
    AbstractControl control) {
    assert(name != null && !name.isEmpty,
        'Cannot add control if its name is not provided.');
    assert(control != null, 'Cannot add control if this one is null.');
    assert(!this.controls.containsKey(name),
        'Cannot add control if this one is already added.');

    this.controls[name] = control;
    this._forceInitialization();
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
    super.removeListener(() { });
  }

  /* Private methods */
  /// Forces the form builder to reinitialize the tree of abstract controls to update itself and add new form groups, form arrays and form controls.
  void _forceInitialization() {
    FormBuilder formBuilder = super.getFormBuilder();
    formBuilder.initialize(formBuilder.formState);
  }

  /* Protected methods */
  @protected
  void clearControls() {
    this.controls.clear();
    super.notifyListeners();
  }

  Future validate() async =>
      await super.validateControl(this, this.formPath, this.modelPath);
}
