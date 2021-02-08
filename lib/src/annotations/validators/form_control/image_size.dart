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
  Future<bool> isValid(FormControl<Uint8List> control, String property) async {
    imageDecoder.Image image = imageDecoder.decodeImage(control.value);
    bool isValid = this._validate(image);
    return isValid;
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
