import 'dart:typed_data';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/file_size.dart';

void main() {
  setUp(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('FileMimeType.', () {
    test('FileMimeType validator returns True (reason: allowed file size).',
        () async {
      FileSize_AllowedFileSize_Stub stub = new FileSize_AllowedFileSize_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      FileSize validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('FileMimeType validator returns True (reason: no file).', () async {
      FileSize_NoFile_Stub stub = new FileSize_NoFile_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      FileSize validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('FileMimeType validator returns False (reason: unallowed file size).',
        () async {
      FileSize_UnallowedFileSize_Stub stub =
          new FileSize_UnallowedFileSize_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      FileSize validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });

    test('FileMimeType validator throws an exception (reason: null file size).',
        () async {
      FileSize_NullFileSize_Stub stub = new FileSize_NullFileSize_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      FileSize validator = stub.getValidator();

      expect(
        () async {
          await validator.isValid(formControl);
        },
        throwsA(
          isA<ValidationException>().having((error) => error.message,
              'description', 'File size is not defined.'),
        ),
      );
    });
  });
}
