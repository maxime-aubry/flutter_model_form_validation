import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class ModelFormControl<TModel extends ModelForm> extends FormControl
    with ModelFormValidator {
  ModelFormControl(
    Object value,
    String name,
    FormGroup parentGroup,
  ) : super(
          value: value,
          name: name,
          parentGroup: parentGroup,
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
    if (name == null || name.isEmpty)
      throw new Exception(
          'Cannot initialize form array if its name is not provided.');

    if (parentGroup == null)
      throw new Exception(
          'Cannot initialize form array if its parent form group is not provided.');

    if (super.isInitialized)
      throw new Exception(
          'Cannot initialize form group if this one is already initialized.');

    ModelFormState<TModel> formState =
        super.getFormState() as ModelFormState<TModel>;
    ModelFormGroup parentGroup2 = this.parentGroup as ModelFormGroup;

    super.controlName = name;

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
