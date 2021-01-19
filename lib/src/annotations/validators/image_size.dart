import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:image/image.dart' as imageDecoder;

/// [ImageSize] validator permits you to check that a string value is a valid image size.
/// {@category Metadata}
/// {@subCategory Validators}
class ImageSize extends FormValidatorAnnotation {
  const ImageSize({
    @required this.minWidth,
    @required this.minHeight,
    @required this.maxWidth,
    @required this.maxHeight,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [minWidth] is the allowed min width.
  final int minWidth;

  /// [minHeight] is the allowed min height.
  final int minHeight;

  /// [maxWidth] is the allowed max width.
  final int maxWidth;

  /// [maxHeight] is the allowed max height.
  final int maxHeight;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid(
    FormGroup root,
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

      imageDecoder.Image image = imageDecoder.decodeImage(value);
      bool isValid = _validate(image);
      return isValid;
    } catch (e) {
      throw new ValidationException(
          'An error occurend with validator on from control with validator of type');
    }
  }

  bool _validate(imageDecoder.Image value) {
    if (value == null) return true;
    if (value.width < this.minWidth ||
        value.height < this.minHeight ||
        value.width > this.maxWidth ||
        value.height > this.maxHeight) return false;
    return true;
  }
}
