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
    this.remoteMinWidth,
    this.remoteMaxWidth,
    this.remoteMinHeight,
    this.remoteMaxHeight,
    @required String error,
  }) : super(error: error);

  /// [minWidth] is the allowed min width.
  final int minWidth;

  /// [maxWidth] is the allowed max width.
  final int maxWidth;

  /// [minHeight] is the allowed min height.
  final int minHeight;

  /// [maxHeight] is the allowed max height.
  final int maxHeight;

  /// [remoteMinWidth] is the name of targeted property that user uses to provide min width. This one has priority on [minWidth].
  final String remoteMinWidth;

  /// [remoteMaxWidth] is the name of targeted property that user uses to provide max width. This one has priority on [maxWidth].
  final String remoteMaxWidth;

  /// [remoteMinHeight] is the name of targeted property that user uses to provide min height. This one has priority on [minHeight].
  final String remoteMinHeight;

  /// [remoteMaxHeight] is the name of targeted property that user uses to provide max height. This one has priority on [maxHeight].
  final String remoteMaxHeight;

  @override
  Future<bool> isValid(FormControl<Uint8List> control) async {
    int minWidth = super.getRemoteValidatorParameter<int>(
      defaultValue: this.minWidth,
      localParameterName: 'minWidth',
      remoteParameterName: this.remoteMinWidth,
      formGroup: control.parentGroup,
    );
    int maxWidth = super.getRemoteValidatorParameter<int>(
      defaultValue: this.maxWidth,
      localParameterName: 'maxWidth',
      remoteParameterName: this.remoteMaxWidth,
      formGroup: control.parentGroup,
    );
    int minHeight = super.getRemoteValidatorParameter<int>(
      defaultValue: this.minHeight,
      localParameterName: 'minHeight',
      remoteParameterName: this.remoteMinHeight,
      formGroup: control.parentGroup,
    );
    int maxHeight = super.getRemoteValidatorParameter<int>(
      defaultValue: this.maxHeight,
      localParameterName: 'maxHeight',
      remoteParameterName: this.remoteMaxHeight,
      formGroup: control.parentGroup,
    );

    this._validateParameters(minWidth, maxWidth, minHeight, maxHeight);
    bool isValid = this._validate(
      control.value,
      minWidth,
      maxWidth,
      minHeight,
      maxHeight,
    );
    return isValid;
  }

  void _validateParameters(
    int minWidth,
    int maxWidth,
    int minHeight,
    int maxHeight,
  ) {
    if (minWidth == null)
      throw new ValidatorParameterException('minWidth is not defined.');

    if (maxWidth == null)
      throw new ValidatorParameterException('maxWidth is not defined.');

    if (minHeight == null)
      throw new ValidatorParameterException('minHeight is not defined.');

    if (maxHeight == null)
      throw new ValidatorParameterException('maxHeight is not defined.');

    if (minWidth.compareTo(maxWidth) > 0)
      throw new ValidationException(
          'minWidth value is greater than maxWidth value.');

    if (minHeight.compareTo(maxHeight) > 0)
      throw new ValidationException(
          'minHeight value is greater than maxHeight value.');
  }

  bool _validate(
    Uint8List value,
    int minWidth,
    int maxWidth,
    int minHeight,
    int maxHeight,
  ) {
    if (value == null) return true;
    imageDecoder.Image image = imageDecoder.decodeImage(value);
    if (image.width < minWidth ||
        image.height < minHeight ||
        image.width > maxWidth ||
        image.height > maxHeight) return false;
    return true;
  }
}
