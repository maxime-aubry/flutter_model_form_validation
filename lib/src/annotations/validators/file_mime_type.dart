import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:mime/mime.dart';

/// [FileMimeType] validator permits you to check that a string value is a valid mime type.
/// {@category Metadata}
/// {@subCategory Validators}
class FileMimeType extends FormValidatorAnnotation {
  const FileMimeType({
    @required this.mimeTypes,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [mimeTypes] is the allowed mime types list.
  final List<String> mimeTypes;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid(
    FormBuilder fb,
    FormGroup fg,
    Object value,
    String formPath,
    String modelFormPath,
  ) async {
    try {
      if (value == null) return true;

      if (value is! Uint8List)
        throw new Exception(
            'field type must be a byte array (list of integer)');

      bool isValid = _validate(value);
      return isValid;
    } catch (e) {
      throw new ValidationException(
          'An error occurend with validator on from control with validator of type');
    }
  }

  bool _validate(Uint8List value) {
    if (value == null) return true;
    String mimeType = lookupMimeType('no-file', headerBytes: value);
    if (this.mimeTypes.contains(mimeType)) return true;
    return false;
  }
}
