import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../main_stub.dart';

abstract class _IFileMimeTypeStub
    extends IStub<FormControl<Uint8List>, FileMimeType> {}

class FileMimeType_AllowedMimeType_Stub extends _IFileMimeTypeStub {
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
  FileMimeType getValidator() => FileMimeType(
        mimeTypes: ['image/jpeg', 'image/bmp'],
        error: 'mime type is not allowed',
      );
}

class FileMimeType_NoFile_Stub extends _IFileMimeTypeStub {
  @override
  FormControl<Uint8List> getControl() {
    FormControl<Uint8List> value = new FormControl<Uint8List>(
      value: null,
      validators: [],
    );
    return value;
  }

  @override
  FileMimeType getValidator() => FileMimeType(
        mimeTypes: ['image/jpeg', 'image/bmp'],
        error: 'mime type is not allowed',
      );
}

class FileMimeType_UnallowedMimeType_Stub extends _IFileMimeTypeStub {
  @override
  FormControl<Uint8List> getControl() {
    File file =
        new File('${Directory.current.path}/test/assets/erable-japonais.png');
    FormControl<Uint8List> value = new FormControl<Uint8List>(
      value: file.readAsBytesSync(),
      validators: [],
    );
    return value;
  }

  @override
  FileMimeType getValidator() => FileMimeType(
        mimeTypes: ['image/jpeg', 'image/bmp'],
        error: 'mime type is not allowed',
      );
}

class FileMimeType_NullMimeTypeArray_Stub extends _IFileMimeTypeStub {
  @override
  FormControl<Uint8List> getControl() {
    File file =
        new File('${Directory.current.path}/test/assets/erable-japonais.png');
    FormControl<Uint8List> value = new FormControl<Uint8List>(
      value: file.readAsBytesSync(),
      validators: [],
    );
    return value;
  }

  @override
  FileMimeType getValidator() =>
      FileMimeType(mimeTypes: null, error: 'mime type is not allowed');
}

class FileMimeType_EmptyMimeTypeArray_Stub extends _IFileMimeTypeStub {
  @override
  FormControl<Uint8List> getControl() {
    File file =
        new File('${Directory.current.path}/test/assets/erable-japonais.png');
    FormControl<Uint8List> value = new FormControl<Uint8List>(
      value: file.readAsBytesSync(),
      validators: [],
    );
    return value;
  }

  @override
  FileMimeType getValidator() =>
      FileMimeType(mimeTypes: [], error: 'mime type is not allowed');
}
