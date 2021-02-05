import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

/// [Required] validator permits you to check that a value is provided.
/// {@category Metadata}
/// {@subCategory Validators}
class Required extends FormValidatorAnnotation {
  const Required({
    @required this.error,
  }) : super(error: error);

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid(
    FormGroup root,
    FormGroup formGroup,
    String property,
  ) async {
    return true;
    // try {
    //   bool isValid = _validate(value);
    //   return isValid;
    // } catch (e) {
    //   throw new ValidationException(
    //       'An error occurend with validator on from control with validator of type');
    // }
  }

  bool _validate(Object value) {
    if (value == null) return false;
    if (value is String && value.isEmpty) return false;
    return true;
  }
}
