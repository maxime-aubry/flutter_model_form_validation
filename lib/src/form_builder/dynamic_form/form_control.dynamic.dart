import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormControl<TCurrentModel> extends FormControlBase
    with DynamicFormValidator {
  FormControl({
    @required TCurrentModel value,
    @required List<FormValidatorAnnotation> validators,
  }) : super(value, '', null) {
    this.status = EAbstractControlStatus.pure;
    this.validators = validators ?? new List<FormValidatorAnnotation>();
    this._initialize();
  }

  void _initialize() {
    if (this.parentGroup != null && this.parentGroup is FormGroup)
      super.initialize(this.parentGroup, this.name);
  }

  Future setValue(Object value) async {
    this.value = value;
    await this.validate();
  }

  Future validate() async => await super.validate$1(
        this.formState,
        this.parentGroup as FormGroup,
        this.name,
        this.value,
        this.formPath,
        this.modelPath,
      );
}
