import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

abstract class _IFileSizeStub extends IStub<FormControl<Uint8List>, FileSize> {}

class FileSize_AllowedFileSize_Stub extends _IFileSizeStub {
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
  FileSize getValidator() => FileSize(
        size: 1048576,
        error: 'unallowed file size',
      );
}

class FileSize_NoFile_Stub extends _IFileSizeStub {
  @override
  FormControl<Uint8List> getControl() {
    FormControl<Uint8List> value = new FormControl<Uint8List>(
      value: null,
      validators: [],
    );
    return value;
  }

  @override
  FileSize getValidator() => FileSize(
        size: 1048576,
        error: 'unallowed file size',
      );
}

class FileSize_UnallowedFileSize_Stub extends _IFileSizeStub {
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
  FileSize getValidator() => FileSize(
        size: 1048576,
        error: 'unallowed file size',
      );
}

class FileSize_NullFileSize_Stub extends _IFileSizeStub {
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
  FileSize getValidator() => FileSize(
        size: null,
        error: 'unallowed file size',
      );
}
