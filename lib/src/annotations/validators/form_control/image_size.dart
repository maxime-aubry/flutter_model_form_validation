import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:image/image.dart' as imageDecoder;

class ImageSize extends FormControlValidatorAnnotation<Uint8List> {
  const ImageSize({
    @required this.minWidth,
    @required this.minHeight,
    @required this.maxWidth,
    @required this.maxHeight,
    @required String error,
  }) : super(error: error);

  /// [minWidth] is the allowed min width.
  final int minWidth;

  /// [minHeight] is the allowed min height.
  final int minHeight;

  /// [maxWidth] is the allowed max width.
  final int maxWidth;

  /// [maxHeight] is the allowed max height.
  final int maxHeight;

  @override
  Future<bool> isValid(FormControl<Uint8List> control) async {
    if (this.minWidth == null)
      throw new ValidationException('Min width is not defined.');
    if (this.maxWidth == null)
      throw new ValidationException('Max width is not defined.');
    if (this.minHeight == null)
      throw new ValidationException('Min height is not defined.');
    if (this.maxHeight == null)
      throw new ValidationException('Max height is not defined.');
    bool isValid = this._validate(control.value);
    return isValid;
  }

  bool _validate(Uint8List value) {
    if (value == null) return true;
    imageDecoder.Image image = imageDecoder.decodeImage(value);
    if (image.width < this.minWidth ||
        image.height < this.minHeight ||
        image.width > this.maxWidth ||
        image.height > this.maxHeight) return false;
    return true;
  }
}
