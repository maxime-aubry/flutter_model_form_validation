import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';
import 'package:image/image.dart' as imageDecoder;

/// [ImageSize] validator permits you to check that a string value is a valid image size.
/// {@category Metadata}
/// {@subCategory Validators}
class ImageSize extends ValidationAnnotation<List<int>> {
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
  bool isValid<TModel>(List<int> value, TModel model) {
    try {
      imageDecoder.Image image = imageDecoder.decodeImage(value);
      bool isValid = _validate(image);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(imageDecoder.Image value) {
    if (value != null) {
      if (value.width < this.minWidth ||
          value.height < this.minHeight ||
          value.width > this.maxWidth ||
          value.height > this.maxHeight) return false;
      return true;
    }
    return false;
  }
}
