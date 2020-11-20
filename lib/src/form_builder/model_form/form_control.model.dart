import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class ModelFormControl<TModel extends ModelForm> extends FormControl
    with ModelFormValidator {
  ModelFormControl({
    @required String name,
    @required FormGroup parentGroup,
    @required Object value,
  }) : super(
          value: value,
          validators: new List<FormValidatorAnnotation>(),
        ) {
    this.initialize(name, parentGroup);
  }

  String get modelPartfullname {
    if (this.controlName == null || this.controlName.isEmpty) return null;
    if (this.controlName == 'root' && this.parentGroup == null) return null;
    ModelFormGroup parentGroup2 = this.parentGroup as ModelFormGroup;
    return '${parentGroup2.current.hashCode}.${this.controlName}';
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

    ModelFormGroup parentGroup2 = this.parentGroup as ModelFormGroup;
    ModelFormBuilder<TModel> formBuilder =
        super.getFormBuilder() as ModelFormBuilder<TModel>;

    formBuilder.addCorrespondence(
      this.modelPartfullname,
      this,
    );

    super.validators = super.getValidators(
      parentGroup2.current,
      super.controlName,
    );

    formBuilder.formState.update(
      super.fullname,
      null,
      super.validation_status,
    );

    super.isInitialized = true;
  }

  @override
  Future validate() async =>
      await super.validateControl(this.value, super.formPath, super.modelPath);
}
