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
    this.validators = validators;
  }
}
