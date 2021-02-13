import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

abstract class FormGroupValidatorAnnotation
    extends FormValidatorAnnotation<FormGroup> {
  const FormGroupValidatorAnnotation({
    String serviceName,
    @required String error,
  }) : super(serviceName: serviceName, error: error);
}
