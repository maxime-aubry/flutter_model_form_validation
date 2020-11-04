import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class FormControl<TCurrentModel> extends FormControlBase
    with DynamicFormValidator {
  FormControl({
    @required TCurrentModel value,
    @required List<FormValidatorAnnotation> validators,
  }) : super(value, '', null) {
    this.validators = validators ?? new List<FormValidatorAnnotation>();
    this._isInitialized = false;
  }

  bool _isInitialized;

  @override
  void initialize(String name, FormGroup parentGroup, FormState formState) {
    assert(name != null, '');
    assert(name != '', '');
    assert(parentGroup != null, '');
    assert(parentGroup is FormGroup, '');
    assert(formState != null, '');
    assert(this._isInitialized == false, '');

    this.parentGroup = parentGroup;
    super.initialize(this.name, this.parentGroup, formState);
    this._isInitialized = true;
  }

  Future setValue(Object value) async {
    this.value = value;
    await this.validate();
  }

  Future validate() async => await super.validate$1(
        this.parentGroup as FormGroup,
        this.name,
        this.value,
        this.formPath,
        this.modelPath,
      );
}
