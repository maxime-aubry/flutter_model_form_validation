import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

abstract class FormControlValidatorAnnotation<TProperty>
    extends FormValidatorAnnotation<FormControl<TProperty>> {
  const FormControlValidatorAnnotation({
    @required String error,
  }) : super(error: error);
}
