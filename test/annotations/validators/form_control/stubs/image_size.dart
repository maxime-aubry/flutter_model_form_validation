import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../stub.dart';

class _ImageSizeTypeStub extends IStub<FormControl<Uint8List>, ImageSize> {
  _ImageSizeTypeStub({
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
      minWidthOnProperty: (fcMinWidth != null) ? 'minWidth' : null,
      maxWidthOnProperty: (fcMaxWidth != null) ? 'maxWidth' : null,
      minHeightOnProperty: (fcMinWidth != null) ? 'minHeight' : null,
      maxHeightOnProperty: (fcMaxHeight != null) ? 'maxHeight' : null,
      error: 'invalid image size',
    );
  }
}

/* Value is valid */
class ImageSizeType_ImageSizeIsAllowed_Stub extends _ImageSizeTypeStub {
  ImageSizeType_ImageSizeIsAllowed_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          fcMinWidth: 800,
          fcMaxWidth: 900,
          fcMinHeight: 500,
          fcMaxHeight: 600,
        );
}

class ImageSizeType_FileIsNull_Stub extends _ImageSizeTypeStub {
  ImageSizeType_FileIsNull_Stub()
      : super(
          file: null,
          fcMinWidth: 800,
          fcMaxWidth: 900,
          fcMinHeight: 500,
          fcMaxHeight: 600,
        );
}

/* Value is not valid */
class ImageSizeType_ImageWidthIsNotAllowed_Stub extends _ImageSizeTypeStub {
  ImageSizeType_ImageWidthIsNotAllowed_Stub()
      : super(
          file: null,
          fcMinWidth: 850,
          fcMaxWidth: 900,
          fcMinHeight: 500,
          fcMaxHeight: 600,
        );
}

class ImageSizeType_ImageHeightIsNotAllowed_Stub extends _ImageSizeTypeStub {
  ImageSizeType_ImageHeightIsNotAllowed_Stub()
      : super(
          file: null,
          fcMinWidth: 800,
          fcMaxWidth: 900,
          fcMinHeight: 550,
          fcMaxHeight: 600,
        );
}

/* Remote parameters are provided */
class ImageSizeType_ImageSizeOnPropertyIsProvided_Stub
    extends _ImageSizeTypeStub {
  ImageSizeType_ImageSizeOnPropertyIsProvided_Stub()
      : super(
          file: null,
          fcMinWidth: 100,
          fcMaxWidth: 100,
          fcMinHeight: 100,
          fcMaxHeight: 100,
          validatorMinWidth: 800,
          validatorMaxWidth: 900,
          validatorMinHeight: 500,
          validatorMaxHeight: 600,
        );
}

/* None parameter is provided */
class ImageSizeType_MinWidthOnPropertyIsNotProvided_Stub
    extends _ImageSizeTypeStub {
  ImageSizeType_MinWidthOnPropertyIsNotProvided_Stub()
      : super(
          file: null,
          fcMinWidth: null,
          fcMaxWidth: 100,
          fcMinHeight: 100,
          fcMaxHeight: 100,
          validatorMinWidth: null,
          validatorMaxWidth: 900,
          validatorMinHeight: 500,
          validatorMaxHeight: 600,
        );
}

class ImageSizeType_MaxWidthOnPropertyIsNotProvided_Stub
    extends _ImageSizeTypeStub {
  ImageSizeType_MaxWidthOnPropertyIsNotProvided_Stub()
      : super(
          file: null,
          fcMinWidth: 100,
          fcMaxWidth: null,
          fcMinHeight: 100,
          fcMaxHeight: 100,
          validatorMinWidth: 800,
          validatorMaxWidth: null,
          validatorMinHeight: 500,
          validatorMaxHeight: 600,
        );
}

class ImageSizeType_MinHeightOnPropertyIsNotProvided_Stub
    extends _ImageSizeTypeStub {
  ImageSizeType_MinHeightOnPropertyIsNotProvided_Stub()
      : super(
          file: null,
          fcMinWidth: 100,
          fcMaxWidth: 100,
          fcMinHeight: null,
          fcMaxHeight: 100,
          validatorMinWidth: 800,
          validatorMaxWidth: 900,
          validatorMinHeight: null,
          validatorMaxHeight: 600,
        );
}

class ImageSizeType_MaxHeightOnPropertyIsNotProvided_Stub
    extends _ImageSizeTypeStub {
  ImageSizeType_MaxHeightOnPropertyIsNotProvided_Stub()
      : super(
          file: null,
          fcMinWidth: 100,
          fcMaxWidth: 100,
          fcMinHeight: 100,
          fcMaxHeight: null,
          validatorMinWidth: 800,
          validatorMaxWidth: 900,
          validatorMinHeight: 500,
          validatorMaxHeight: null,
        );
}
