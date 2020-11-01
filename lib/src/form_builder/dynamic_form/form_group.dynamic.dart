import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormGroup extends FormGroupBase with DynamicFormValidator {
  FormGroup({
    @required Map<String, AbstractControl> controls,
    @required List<FormValidatorAnnotation> validators,
  }) : super('', null, controls, false) {
    this.validators = validators;
  }
}
