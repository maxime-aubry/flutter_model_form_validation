import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _FileMimeTypeStub
    extends ValidatorStub<FormControl<Uint8List>, FileMimeType> {
  _FileMimeTypeStub({
    File file,
    List<String> localMimeTypes,
  }) : super() {
    super.control = new FormControl<Uint8List>(
      value: file?.readAsBytesSync(),
      validators: [],
    );
    super.validator = FileMimeType(
      mimeTypes: localMimeTypes,
      error: null,
    );
  }
}

/* Value is valid */
class FileMimeType_MimeTypeIsAllowed_Stub extends _FileMimeTypeStub {
  FileMimeType_MimeTypeIsAllowed_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          localMimeTypes: ['image/jpeg', 'image/bmp'],
        );
}

class FileMimeType_NoFile_Stub extends _FileMimeTypeStub {
  FileMimeType_NoFile_Stub()
      : super(
          file: null,
          localMimeTypes: ['image/jpeg', 'image/bmp'],
        );
}

/* Value is not valid */
class FileMimeType_MimeTypeIsNotAllowed_Stub extends _FileMimeTypeStub {
  FileMimeType_MimeTypeIsNotAllowed_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          localMimeTypes: ['image/png', 'image/bmp'],
        );
}

/* Remote parameters are provided */

/* Exceptions on parameters */
class FileMimeType_ThrowsValidatorParameterExceptionOnNullMimeTypesArray_Stub
    extends _FileMimeTypeStub {
  FileMimeType_ThrowsValidatorParameterExceptionOnNullMimeTypesArray_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          localMimeTypes: null,
        );
}

class FileMimeType_ThrowsValidatorParameterExceptionOnEmptyMimeTypesArray_Stub
    extends _FileMimeTypeStub {
  FileMimeType_ThrowsValidatorParameterExceptionOnEmptyMimeTypesArray_Stub()
      : super(
          file: new File('${Directory.current.path}/test/assets/glycine.jpg'),
          localMimeTypes: [],
        );
}
