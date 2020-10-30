import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormArray extends FormArrayBase with DynamicFormValidator {
  FormArray({
    @required List<FormGroup> groups,
    @required List<FormValidatorAnnotation> validators,
  }) : super('', null, groups) {
    this.validators = validators;
  }
}
