import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

/// [FileSize] validator permits you to check that a string value is a valid size.
/// {@category Metadata}
/// {@subCategory Validators}
class FileSize extends FormValidatorAnnotation {
  const FileSize({
    @required this.size,
    @required this.error,
  }) : super(error: error);

  /// [size] is the allowed size.
  final int size;

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

    //   if (value is! Uint8List)
    //     throw new Exception(
    //         'field type must be a byte array (list of integer)');

    //   bool isValid = _validate(value);
    //   return isValid;
    // } catch (e) {
    //   throw new ValidationException(
    //       'An error occurend with validator on from control with validator of type');
    // }
  }

  bool _validate(Uint8List value) {
    if (value == null) return true;
    if (value.length <= this.size) return true;
    return false;
  }
}
