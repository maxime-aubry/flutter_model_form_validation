import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../stub.dart';

class _ImageSizeStub extends IStub<FormControl<Uint8List>, ImageSize> {
  _ImageSizeStub({
    File file,
    int fcMinWidth,
    int fcMaxWidth,
    int fcMinHeight,
    int fcMaxHeight,
    int validatorMinWidth,
    int validatorMaxWidth,
    int validatorMinHeight,
    int validatorMaxHeight,
  }) : super() {
    FormControl<Uint8List> _value = new FormControl<Uint8List>(
      value: file.readAsBytesSync(),
      validators: [],
    );
    FormControl<int> _minWidth = new FormControl<int>(
      value: fcMinWidth,
      validators: [],
    );
    FormControl<int> _maxWidth = new FormControl<int>(
      value: fcMaxWidth,
      validators: [],
    );
    FormControl<int> _minHeight = new FormControl<int>(
      value: fcMinHeight,
      validators: [],
    );
    FormControl<int> _maxHeight = new FormControl<int>(
      value: fcMaxHeight,
      validators: [],
    );
    FormGroup _root = new FormGroup(
      controls: {
        'value': _value,
        'minWidth': _minWidth,
        'maxWidth': _maxWidth,
        'minHeight': _minHeight,
        'maxHeight': _maxHeight,
      },
      validators: [],
    );
    _value.parentGroup = _root;
    _minWidth.parentGroup = _root;
    _maxWidth.parentGroup = _root;
    _minHeight.parentGroup = _root;
    _maxHeight.parentGroup = _root;

    super.control = _value;
    super.validator = ImageSize(
      minWidth: validatorMinWidth,
      maxWidth: validatorMaxWidth,
      minHeight: validatorMinHeight,
      maxHeight: validatorMaxHeight,
      remoteMinWidth: (fcMinWidth != null) ? 'minWidth' : null,
      remoteMaxWidth: (fcMaxWidth != null) ? 'maxWidth' : null,
      remoteMinHeight: (fcMinWidth != null) ? 'minHeight' : null,
      remoteMaxHeight: (fcMaxHeight != null) ? 'maxHeight' : null,
      error: 'invalid image size',
    );
  }
}

/* Value is valid */
class ImageSize_ImageSizeIsAllowed_Stub extends _ImageSizeStub {
  ImageSize_ImageSizeIsAllowed_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          validatorMinWidth: 800,
          validatorMaxWidth: 900,
          validatorMinHeight: 500,
          validatorMaxHeight: 600,
        );
}

class ImageSize_FileIsNull_Stub extends _ImageSizeStub {
  ImageSize_FileIsNull_Stub()
      : super(
          file: null,
          validatorMinWidth: 800,
          validatorMaxWidth: 900,
          validatorMinHeight: 500,
          validatorMaxHeight: 600,
        );
}

/* Value is not valid */
class ImageSize_ImageWidthIsNotAllowed_Stub extends _ImageSizeStub {
  ImageSize_ImageWidthIsNotAllowed_Stub()
      : super(
          file: null,
          validatorMinWidth: 850,
          validatorMaxWidth: 900,
          validatorMinHeight: 500,
          validatorMaxHeight: 600,
        );
}

class ImageSize_ImageHeightIsNotAllowed_Stub extends _ImageSizeStub {
  ImageSize_ImageHeightIsNotAllowed_Stub()
      : super(
          file: null,
          validatorMinWidth: 800,
          validatorMaxWidth: 900,
          validatorMinHeight: 550,
          validatorMaxHeight: 600,
        );
}

/* Remote parameters are provided */
class ImageSize_ImageSizeOnPropertyIsProvided_Stub extends _ImageSizeStub {
  ImageSize_ImageSizeOnPropertyIsProvided_Stub()
      : super(
          file: null,
          validatorMinWidth: 800,
          validatorMaxWidth: 900,
          validatorMinHeight: 500,
          validatorMaxHeight: 600,
          fcMinWidth: 100,
          fcMaxWidth: 100,
          fcMinHeight: 100,
          fcMaxHeight: 100,
        );
}

/* Exceptions on parameters */
class ImageSize_ThrowsValidatorParameterExceptionOnNullMinWidth_Stub
    extends _ImageSizeStub {
  ImageSize_ThrowsValidatorParameterExceptionOnNullMinWidth_Stub()
      : super(
          file: null,
          validatorMinWidth: null,
          validatorMaxWidth: 900,
          validatorMinHeight: 500,
          validatorMaxHeight: 600,
          fcMinWidth: null,
          fcMaxWidth: 100,
          fcMinHeight: 100,
          fcMaxHeight: 100,
        );
}

class ImageSize_ThrowsValidatorParameterExceptionOnNullMaxWidth_Stub
    extends _ImageSizeStub {
  ImageSize_ThrowsValidatorParameterExceptionOnNullMaxWidth_Stub()
      : super(
          file: null,
          validatorMinWidth: 800,
          validatorMaxWidth: null,
          validatorMinHeight: 500,
          validatorMaxHeight: 600,
          fcMinWidth: 100,
          fcMaxWidth: null,
          fcMinHeight: 100,
          fcMaxHeight: 100,
        );
}

class ImageSize_ThrowsValidatorParameterExceptionOnNullMinHeight_Stub
    extends _ImageSizeStub {
  ImageSize_ThrowsValidatorParameterExceptionOnNullMinHeight_Stub()
      : super(
          file: null,
          validatorMinWidth: 800,
          validatorMaxWidth: 900,
          validatorMinHeight: null,
          validatorMaxHeight: 600,
          fcMinWidth: 100,
          fcMaxWidth: 100,
          fcMinHeight: null,
          fcMaxHeight: 100,
        );
}

class ImageSize_ThrowsValidatorParameterExceptionOnNullMaxHeight_Stub
    extends _ImageSizeStub {
  ImageSize_ThrowsValidatorParameterExceptionOnNullMaxHeight_Stub()
      : super(
          file: null,
          validatorMinWidth: 800,
          validatorMaxWidth: 900,
          validatorMinHeight: 500,
          validatorMaxHeight: null,
          fcMinWidth: 100,
          fcMaxWidth: 100,
          fcMinHeight: 100,
          fcMaxHeight: null,
        );
}
