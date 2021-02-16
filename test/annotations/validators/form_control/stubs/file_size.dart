import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../stub.dart';

class _FileSizeStub extends IStub<FormControl<Uint8List>, FileSize> {
  _FileSizeStub({
    File file,
    int size,
  }) : super() {
    this.control = new FormControl<Uint8List>(
      value: file?.readAsBytesSync(),
      validators: [],
    );
    this.validator = FileSize(
      size: size,
      error: 'invalid file size',
    );
  }
}

/* Value is valid */
class FileSize_FileSizeIsAllowed_Stub extends _FileSizeStub {
  FileSize_FileSizeIsAllowed_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          size: 1048576,
        );
}

class FileSize_NoFile_Stub extends _FileSizeStub {
  FileSize_NoFile_Stub()
      : super(
          file: null,
          size: 1048576,
        );
}

/* Value is not valid */
class FileSize_FileSizeIsNotAllowed_Stub extends _FileSizeStub {
  FileSize_FileSizeIsNotAllowed_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          size: 524288,
        );
}

/* Remote parameters are provided */

/* Exceptions on parameters */
class FileSize_ThrowsValidatorParameterExceptionOnNullSize_Stub
    extends _FileSizeStub {
  FileSize_ThrowsValidatorParameterExceptionOnNullSize_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          size: null,
        );
}

/* File not found */
class FileSize_FileNotFound_Stub extends _FileSizeStub {
  FileSize_FileNotFound_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/not-found.jpg'),
          size: 1048576,
        );
}
