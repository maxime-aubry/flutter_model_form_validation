import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class ReactiveFormBuilder {
  ReactiveFormBuilder({
    @required this.group,
  });

  FormGroup group;
  ReactiveFormState formState;

  void initialize(ReactiveFormState formState) {
    assert(formState != null,
        'Cannot initialize form builder if form state is not provided.');

    this.formState = formState;
    this.group.formBuilder = this;
    this._initializeFormGroup(this.group, null, 'root');
    this.checkMultipleStepsForm();
  }

  /// If current form is multiple steps form, check if root level contains only form groups.
  /// If it does not, throw an exception.
  @protected
  void checkMultipleStepsForm() {
    bool isValidMultipleStepsForm = !this
        .group
        .controls
        .entries
        .toList()
        .any((element) => element.value is! FormGroup);

    if (this.formState.isMultipleStepsForm && !isValidMultipleStepsForm)
      throw new Exception(
          'A form with multipe steps must contains form groups only into its root level.');
  }

  void _initializeFormGroup(
    FormGroup current,
    FormGroup parentGroup,
    String name, [
    bool isArrayItem = false,
  ]) {
    if (!current.isInitialized)
      current.initialize(name, parentGroup, isArrayItem);

    for (MapEntry<String, AbstractControl> child in current.controls.entries) {
      if (child.value is FormGroup)
        this._initializeFormGroup(child.value, current, child.key);

      if (child.value is FormArray)
        this._initializeFormArray(child.value, current, child.key);

      if (child.value is FormControl)
        this._initializeFormControl(child.value, current, child.key);
    }
  }

  void _initializeFormArray(
    FormArray current,
    FormGroup parentGroup,
    String name,
  ) {
    if (!current.isInitialized)
      current.initialize(name, parentGroup);

    for (FormGroup formGroup in current.groups)
      this._initializeFormGroup(
        formGroup,
        parentGroup,
        '$name[${current.groups.indexOf(formGroup)}]',
        true,
      );
  }

  void _initializeFormControl(
    FormControl current,
    FormGroup parentGroup,
    String name,
  ) {
    if (!current.isInitialized)
      current.initialize(name, parentGroup);
  }
}
