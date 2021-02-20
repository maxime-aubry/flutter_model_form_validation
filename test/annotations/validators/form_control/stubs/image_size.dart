import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../stubs.dart';

class _ImageSizeStub extends ValidatorStub<FormControl<Uint8List>, ImageSize> {
  _ImageSizeStub({
    File file,
    int remoteMinWidth,
    int remoteMaxWidth,
    int remoteMinHeight,
    int remoteMaxHeight,
    String remoteMinWidthName,
    String remoteMaxWidthName,
    String remoteMinHeightName,
    String remoteMaxHeightName,
    int localeMinWidth,
    int localeMaxWidth,
    int localeMinHeight,
    int localeMaxHeight,
  }) : super() {
    FormControl<Uint8List> _value = new FormControl<Uint8List>(
      value: file?.readAsBytesSync(),
      validators: [],
    );
    FormControl<int> _minWidth = new FormControl<int>(
      value: remoteMinWidth,
      validators: [],
    );
    FormControl<int> _maxWidth = new FormControl<int>(
      value: remoteMaxWidth,
      validators: [],
    );
    FormControl<int> _minHeight = new FormControl<int>(
      value: remoteMinHeight,
      validators: [],
    );
    FormControl<int> _maxHeight = new FormControl<int>(
      value: remoteMaxHeight,
      validators: [],
    );

    Map<String, AbstractControl> controls = {'value': _value};
    if (remoteMinWidthName != null) controls[remoteMinWidthName] = _minWidth;
    if (remoteMaxWidthName != null) controls[remoteMaxWidthName] = _maxWidth;
    if (remoteMinHeightName != null) controls[remoteMinHeightName] = _minHeight;
    if (remoteMaxHeightName != null) controls[remoteMaxHeightName] = _maxHeight;

    FormGroup _root = new FormGroup(
      controls: controls,
      validators: [],
    );

    _value.parentGroup = _root;
    _minWidth.parentGroup = _root;
    _maxWidth.parentGroup = _root;
    _minHeight.parentGroup = _root;
    _maxHeight.parentGroup = _root;

    super.control = _value;
    super.validator = ImageSize(
      minWidth: localeMinWidth,
      maxWidth: localeMaxWidth,
      minHeight: localeMinHeight,
      maxHeight: localeMaxHeight,
      remoteMinWidth: remoteMinWidthName,
      remoteMaxWidth: remoteMaxWidthName,
      remoteMinHeight: remoteMinHeightName,
      remoteMaxHeight: remoteMaxHeightName,
      error: null,
    );
  }
}

/* Value is valid */
class ImageSize_ImageSizeIsAllowed_Stub extends _ImageSizeStub {
  ImageSize_ImageSizeIsAllowed_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          localeMinWidth: 800,
          localeMaxWidth: 900,
          localeMinHeight: 500,
          localeMaxHeight: 600,
        );
}

class ImageSize_FileIsNull_Stub extends _ImageSizeStub {
  ImageSize_FileIsNull_Stub()
      : super(
          file: null,
          localeMinWidth: 800,
          localeMaxWidth: 900,
          localeMinHeight: 500,
          localeMaxHeight: 600,
        );
}

/* Value is not valid */
class ImageSize_ImageWidthIsNotAllowed_Stub extends _ImageSizeStub {
  ImageSize_ImageWidthIsNotAllowed_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          localeMinWidth: 850,
          localeMaxWidth: 900,
          localeMinHeight: 500,
          localeMaxHeight: 600,
        );
}

class ImageSize_ImageHeightIsNotAllowed_Stub extends _ImageSizeStub {
  ImageSize_ImageHeightIsNotAllowed_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          localeMinWidth: 800,
          localeMaxWidth: 900,
          localeMinHeight: 550,
          localeMaxHeight: 600,
        );
}

/* Remote parameters are provided */
class ImageSize_remoteWidthAndHeightAreProvided_Stub extends _ImageSizeStub {
  ImageSize_remoteWidthAndHeightAreProvided_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/arbre.jpg'),
          remoteMinWidth: 50,
          remoteMaxWidth: 150,
          remoteMinHeight: 50,
          remoteMaxHeight: 150,
          remoteMinWidthName: 'minWidth',
          remoteMaxWidthName: 'maxWidth',
          remoteMinHeightName: 'minHeight',
          remoteMaxHeightName: 'maxHeight',
          localeMinWidth: 800,
          localeMaxWidth: 900,
          localeMinHeight: 500,
          localeMaxHeight: 600,
        );
}

/* Exceptions */
class ImageSize_ThrowsValidatorParameterExceptionOnNullMinWidth_Stub
    extends _ImageSizeStub {
  ImageSize_ThrowsValidatorParameterExceptionOnNullMinWidth_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          remoteMinWidth: null,
          remoteMaxWidth: 100,
          remoteMinHeight: 100,
          remoteMaxHeight: 100,
          localeMinWidth: null,
          localeMaxWidth: 900,
          localeMinHeight: 500,
          localeMaxHeight: 600,
        );
}

class ImageSize_ThrowsValidatorParameterExceptionOnNullMaxWidth_Stub
    extends _ImageSizeStub {
  ImageSize_ThrowsValidatorParameterExceptionOnNullMaxWidth_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          remoteMinWidth: 100,
          remoteMaxWidth: null,
          remoteMinHeight: 100,
          remoteMaxHeight: 100,
          localeMinWidth: 800,
          localeMaxWidth: null,
          localeMinHeight: 500,
          localeMaxHeight: 600,
        );
}

class ImageSize_ThrowsValidatorParameterExceptionOnNullMinHeight_Stub
    extends _ImageSizeStub {
  ImageSize_ThrowsValidatorParameterExceptionOnNullMinHeight_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          remoteMinWidth: 100,
          remoteMaxWidth: 100,
          remoteMinHeight: null,
          remoteMaxHeight: 100,
          localeMinWidth: 800,
          localeMaxWidth: 900,
          localeMinHeight: null,
          localeMaxHeight: 600,
        );
}

class ImageSize_ThrowsValidatorParameterExceptionOnNullMaxHeight_Stub
    extends _ImageSizeStub {
  ImageSize_ThrowsValidatorParameterExceptionOnNullMaxHeight_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          remoteMinWidth: 100,
          remoteMaxWidth: 100,
          remoteMinHeight: 100,
          remoteMaxHeight: null,
          localeMinWidth: 800,
          localeMaxWidth: 900,
          localeMinHeight: 500,
          localeMaxHeight: null,
        );
}

class ImageSize_ThrowsValidatorParameterExceptionOnMinWidthGreaterThanMaxWidth_Stub
    extends _ImageSizeStub {
  ImageSize_ThrowsValidatorParameterExceptionOnMinWidthGreaterThanMaxWidth_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          localeMinWidth: 1000,
          localeMaxWidth: 900,
          localeMinHeight: 500,
          localeMaxHeight: 600,
        );
}

class ImageSize_ThrowsValidatorParameterExceptionOnMinHeightGreaterThanMaxHeight_Stub
    extends _ImageSizeStub {
  ImageSize_ThrowsValidatorParameterExceptionOnMinHeightGreaterThanMaxHeight_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          localeMinWidth: 800,
          localeMaxWidth: 900,
          localeMinHeight: 700,
          localeMaxHeight: 600,
        );
}

class ImageSize_ThrowsValidationExceptionOnFileIsNotImage_Stub
    extends _ImageSizeStub {
  ImageSize_ThrowsValidationExceptionOnFileIsNotImage_Stub()
      : super(
          file: new File(
              '${Directory.current.path}/test/assets/image.base64.txt'),
          localeMinWidth: 800,
          localeMaxWidth: 900,
          localeMinHeight: 500,
          localeMaxHeight: 600,
        );
}
