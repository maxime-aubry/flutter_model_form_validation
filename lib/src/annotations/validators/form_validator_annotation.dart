import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

/// [FormValidatorAnnotation] is the parent class for every validators you will create and use.
/// {@category Metadata}
/// {@subCategory Form declarations}
abstract class FormValidatorAnnotation<TAbstractControl extends AbstractControl>
    with FormValidatorNavigator {
  const FormValidatorAnnotation({
    this.serviceName,
    @required this.error,
  });

  /// [serviceName] allows to use a service to load data.
  final String serviceName;

  /// [error] is the error to display.
  final String error;

  Future<bool> isValid(TAbstractControl control);
}
