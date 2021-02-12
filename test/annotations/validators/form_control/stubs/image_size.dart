import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

abstract class _IImageSizeStub
    extends IStub<FormControl<Uint8List>, ImageSize> {}

class ImageSize_AllowedImageSize_Stub extends _IImageSizeStub {
  @override
  FormControl<Uint8List> getControl() {
    File file = new File('${Directory.current.path}/test/assets/glycine.jpg');
    FormControl<Uint8List> value = new FormControl<Uint8List>(
      value: file.readAsBytesSync(),
      validators: [],
    );
    return value;
  }

  @override
  ImageSize getValidator() => ImageSize(
        minWidth: 800,
        maxWidth: 1000,
        minHeight: 500,
        maxHeight: 600,
        error: 'unallowed image size',
      );
}

class ImageSize_NoFile_Stub extends _IImageSizeStub {
  @override
  FormControl<Uint8List> getControl() {
    FormControl<Uint8List> value = new FormControl<Uint8List>(
      value: null,
      validators: [],
    );
    return value;
  }

  @override
  ImageSize getValidator() => ImageSize(
        minWidth: 800,
        maxWidth: 1000,
        minHeight: 500,
        maxHeight: 600,
        error: 'unallowed image size',
      );
}

class ImageSize_UnallowedImageWidth_Stub extends _IImageSizeStub {
  @override
  FormControl<Uint8List> getControl() {
    File file = new File('${Directory.current.path}/test/assets/glycine.jpg');
    FormControl<Uint8List> value = new FormControl<Uint8List>(
      value: file.readAsBytesSync(),
      validators: [],
    );
    return value;
  }

  @override
  ImageSize getValidator() => ImageSize(
        minWidth: 850,
        maxWidth: 1000,
        minHeight: 500,
        maxHeight: 600,
        error: 'unallowed image size',
      );
}

class ImageSize_UnallowedImageHeight_Stub extends _IImageSizeStub {
  @override
  FormControl<Uint8List> getControl() {
    File file = new File('${Directory.current.path}/test/assets/glycine.jpg');
    FormControl<Uint8List> value = new FormControl<Uint8List>(
      value: file.readAsBytesSync(),
      validators: [],
    );
    return value;
  }

  @override
  ImageSize getValidator() => ImageSize(
        minWidth: 800,
        maxWidth: 1000,
        minHeight: 550,
        maxHeight: 600,
        error: 'unallowed image size',
      );
}

class ImageSize_NullImageMinWidth_Stub extends _IImageSizeStub {
  @override
  FormControl<Uint8List> getControl() {
    File file = new File('${Directory.current.path}/test/assets/glycine.jpg');
    FormControl<Uint8List> value = new FormControl<Uint8List>(
      value: file.readAsBytesSync(),
      validators: [],
    );
    return value;
  }

  @override
  ImageSize getValidator() => ImageSize(
        minWidth: null,
        maxWidth: 1000,
        minHeight: 500,
        maxHeight: 600,
        error: 'unallowed image size',
      );
}

class ImageSize_NullImageMaxWidth_Stub extends _IImageSizeStub {
  @override
  FormControl<Uint8List> getControl() {
    File file = new File('${Directory.current.path}/test/assets/glycine.jpg');
    FormControl<Uint8List> value = new FormControl<Uint8List>(
      value: file.readAsBytesSync(),
      validators: [],
    );
    return value;
  }

  @override
  ImageSize getValidator() => ImageSize(
        minWidth: 800,
        maxWidth: null,
        minHeight: 500,
        maxHeight: 600,
        error: 'unallowed image size',
      );
}

class ImageSize_NullImageMinHeight_Stub extends _IImageSizeStub {
  @override
  FormControl<Uint8List> getControl() {
    File file = new File('${Directory.current.path}/test/assets/glycine.jpg');
    FormControl<Uint8List> value = new FormControl<Uint8List>(
      value: file.readAsBytesSync(),
      validators: [],
    );
    return value;
  }

  @override
  ImageSize getValidator() => ImageSize(
        minWidth: 800,
        maxWidth: 1000,
        minHeight: null,
        maxHeight: 600,
        error: 'unallowed image size',
      );
}

class ImageSize_NullImageMaxHeight_Stub extends _IImageSizeStub {
  @override
  FormControl<Uint8List> getControl() {
    File file = new File('${Directory.current.path}/test/assets/glycine.jpg');
    FormControl<Uint8List> value = new FormControl<Uint8List>(
      value: file.readAsBytesSync(),
      validators: [],
    );
    return value;
  }

  @override
  ImageSize getValidator() => ImageSize(
        minWidth: 800,
        maxWidth: 1000,
        minHeight: 500,
        maxHeight: null,
        error: 'unallowed image size',
      );
}
