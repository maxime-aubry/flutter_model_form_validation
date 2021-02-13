import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:image/image.dart' as imageDecoder;

class ImageSize extends FormControlValidatorAnnotation<Uint8List> {
  const ImageSize({
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.minWidthOnProperty,
    this.maxWidthOnProperty,
    this.minHeightOnProperty,
    this.maxHeightOnProperty,
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

  /// [minWidthOnProperty] is the name of targeted property that user uses to provide min width. This one has priority on [minWidth].
  final String minWidthOnProperty;

  /// [minHeightOnProperty] is the name of targeted property that user uses to provide min height. This one has priority on [minHeight].
  final String minHeightOnProperty;

  /// [maxWidthOnProperty] is the name of targeted property that user uses to provide max width. This one has priority on [maxWidth].
  final String maxWidthOnProperty;

  /// [maxHeightOnProperty] is the name of targeted property that user uses to provide max height. This one has priority on [maxHeight].
  final String maxHeightOnProperty;

  @override
  Future<bool> isValid(FormControl<Uint8List> control) async {
    int minWidth = super.getValidatorParameter<int>(
      control,
      this.minWidthOnProperty,
      this.minWidth,
    );
    int maxWidth = super.getValidatorParameter<int>(
      control,
      this.maxWidthOnProperty,
      this.maxWidth,
    );
    int minHeight = super.getValidatorParameter<int>(
      control,
      this.minHeightOnProperty,
      this.minHeight,
    );
    int maxHeight = super.getValidatorParameter<int>(
      control,
      this.maxHeightOnProperty,
      this.maxHeight,
    );
    if (minWidth == null)
      throw new ValidationException('Min width is not defined.');
    if (maxWidth == null)
      throw new ValidationException('Max width is not defined.');
    if (minHeight == null)
      throw new ValidationException('Min height is not defined.');
    if (maxHeight == null)
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
