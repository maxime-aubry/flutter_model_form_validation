import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class ModelFormControl<TModel extends ModelForm> extends FormControl
    with ModelFormValidator {
  ModelFormControl(
    String name,
    FormGroup parentGroup,
    Object value,
  ) : super(
          value: value,
          validators: new List<FormValidatorAnnotation>(),
        ) {
    this.initialize(name, parentGroup);
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
    assert(!super.isInitialized,
        'Cannot initialize form group if this one is already initialized.');

    super.controlName = name;
    super.parentGroup = parentGroup;

    ModelFormState<TModel> formState =
        super.getFormState() as ModelFormState<TModel>;
    ModelFormGroup parentGroup2 = this.parentGroup as ModelFormGroup;

    super.validators = super.getValidators(
      parentGroup2.current,
      super.controlName,
    );

    formState.update(
      super.fullname,
      null,
      super.status,
    );

    super.isInitialized = true;
  }

  @override
  Future validate() async =>
      await super.validateControl(this.value, super.formPath, super.modelPath);
}
