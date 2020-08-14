import 'package:flutter/widgets.dart';
// import 'package:image/image.dart' as DBImage;
import '../validation_annotation.dart';

/// [ImageSize] validator permits you to check that a string value is a valid image size.
/// {@category Metadata}
/// {@subCategory Validators}
class ImageSize extends ValidationAnnotation {
  const ImageSize({
    @required this.minWidth,
    @required this.minHeight,
    @required this.maxWidth,
    @required this.maxHeight,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// This is the allowed min width.
  final int minWidth;

  /// This is the allowed min height.
  final int minHeight;

  /// This is the allowed max width.
  final int maxWidth;

  /// This is the allowed max height.
  final int maxHeight;

  /// This is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(Object value, TModel model) {
    try {
      if (value is! Image) return false;
      return _validate(value);
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(Image value) {
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
