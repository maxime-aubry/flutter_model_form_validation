import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';

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
    super.value = value;
    this.initialize(name, parentGroup);
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
    assert(!super.isInitialized,
        'Cannot initialize form group if this one is already initialized.');

    super.name = name;
    super.parentGroup = parentGroup;

    ModelFormGroup parentGroup2 = this.parentGroup as ModelFormGroup;
    ModelFormBuilder formBuilder = super.getFormBuilder() as ModelFormBuilder;
    FormControlElement formElement = super.getModelPart<FormControlElement>(
      parentGroup2.current,
      this.name,
    );

    formBuilder.addCorrespondence(
      this.modelPartfullname,
      this,
    );

    super.validators = super.getValidators(
      parentGroup2.current,
      super.name,
    );

    formBuilder.formState.update(
      super.fullname,
      null,
      super.status,
    );

    formElement.addListener(() {
      this.value = formElement.value;
    });

    super.isInitialized = true;
  }

  @override
  Future validate() async =>
      await super.validateControl(this.value, super.formPath, super.modelPath);
}
