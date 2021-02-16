import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _FileMimeTypeStub extends IStub<FormControl<Uint8List>, FileMimeType> {
  _FileMimeTypeStub({
    File file,
    List<String> mimeTypes,
  }) : super() {
    this.control = new FormControl<Uint8List>(
      value: file?.readAsBytesSync(),
      validators: [],
    );
    this.validator = FileMimeType(
      mimeTypes: mimeTypes,
      error: 'invalid mime type',
    );
  }
}

/* Value is valid */
class FileMimeType_MimeTypeIsAllowed_Stub extends _FileMimeTypeStub {
  FileMimeType_MimeTypeIsAllowed_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          mimeTypes: ['image/jpeg', 'image/bmp'],
        );
}

class FileMimeType_NoFile_Stub extends _FileMimeTypeStub {
  FileMimeType_NoFile_Stub()
      : super(
          file: null,
          mimeTypes: ['image/jpeg', 'image/bmp'],
        );
}

/* Value is not valid */
class FileMimeType_MimeTypeIsNotAllowed_Stub extends _FileMimeTypeStub {
  FileMimeType_MimeTypeIsNotAllowed_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          mimeTypes: ['image/png', 'image/bmp'],
        );
}

/* Remote parameters are provided */

/* None parameter is provided */
class FileMimeType_ThrowsValidatorParameterExceptionOnNullMimeTypesArray_Stub
    extends _FileMimeTypeStub {
  FileMimeType_ThrowsValidatorParameterExceptionOnNullMimeTypesArray_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          mimeTypes: null,
        );
}

class FileMimeType_ThrowsValidatorParameterExceptionOnEmptyMimeTypesArray_Stub
    extends _FileMimeTypeStub {
  FileMimeType_ThrowsValidatorParameterExceptionOnEmptyMimeTypesArray_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          mimeTypes: [],
        );
}

/* File not found */
class FileMimeType_FileNotFound_Stub extends _FileMimeTypeStub {
  FileMimeType_FileNotFound_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/not-found.jpg'),
          mimeTypes: ['image/jpeg', 'image/bmp'],
        );
}
