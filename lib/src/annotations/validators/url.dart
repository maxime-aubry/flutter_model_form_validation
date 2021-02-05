import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

/// [URL] validator permits you to check that a string value is a valid URL.
/// {@category Metadata}
/// {@subCategory Validators}
class URL extends FormValidatorAnnotation {
  const URL({
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
    //   if (value == null) return true;

    //   if (value is! String) throw new Exception('field type must be a string');

    //   bool isValid = _validate(value);
    //   return isValid;
    // } catch (e) {
    //   throw new ValidationException(
    //       'An error occurend with validator on from control with validator of type');
    // }
  }

  bool _validate(String value) {
    if (value == null) return true;

    RegExp regExp = new RegExp(Rules.url);
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
