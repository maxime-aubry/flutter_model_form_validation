import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form/model_form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class ModelFormControl<TField> extends FormControl<TField>
    with ModelFormValidator {
  ModelFormControl({
    @required String name,
    @required FormGroup parentGroup,
    @required TField value,
  }) : super(
          value: null,
          validators: [],
        ) {
    // super.value = value;
    // this.initialize(name, parentGroup);
  }

  String get modelPartfullname {
    if (this.name == null || this.name.isEmpty) return null;
    if (this.name == 'root' && this.parentGroup == null) return null;
    ModelFormGroup parentGroup2 = this.parentGroup as ModelFormGroup;
    return '${parentGroup2.current.hashCode}.${this.name}';
  }

  @override
  @protected
  void initialize(
    String name,
    FormGroup parentGroup,
  ) {
    assert(name != null && !name.isEmpty,
        'Cannot initialize form array if its name is not provided.');
    assert(parentGroup != null,
        'Cannot initialize form array if its parent form group is not provided.');
    // assert(!super.isInitialized,
    //     'Cannot initialize form group if this one is already initialized.');

    super.name = name;
    super.parentGroup = parentGroup;
    super.getValidators(super.parentGroup, super.name);
    this._updateValueOnModelChange(super.parentGroup);
    // super.isInitialized = true;
  }

  @override
  Future validate() async =>
      await super.validateControl(this.value, super.formPath, super.modelPath);

  /* Private methods */
  void _updateValueOnModelChange(ModelFormGroup parentGroup) {
    FormControlElement formElement = super.getModelPart<FormControlElement>(
      parentGroup.current,
      this.name,
    );
    formElement.addListener(() {
      // this.value = formElement.value;
    });
  }
}
