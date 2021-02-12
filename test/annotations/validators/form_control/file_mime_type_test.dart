import 'dart:typed_data';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/file_mime_type.dart';

void main() {
  setUp(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('FileMimeType.', () {
    test('FileMimeType validator returns True (reason: mime type is allowed).',
        () async {
      FileMimeType_AllowedMimeType_Stub stub =
          new FileMimeType_AllowedMimeType_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      FileMimeType validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('FileMimeType validator returns True (reason: no file provided).',
        () async {
      FileMimeType_NoFile_Stub stub = new FileMimeType_NoFile_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      FileMimeType validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('FileMimeType validator returns False (reason: unallowed mime type).',
        () async {
      FileMimeType_UnallowedMimeType_Stub stub =
          new FileMimeType_UnallowedMimeType_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      FileMimeType validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });

    test('FileMimeType validator returns False (reason: null mime type array).',
        () async {
      FileMimeType_NullMimeTypeArray_Stub stub =
          new FileMimeType_NullMimeTypeArray_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      FileMimeType validator = stub.getValidator();

      expect(
        () async {
          await validator.isValid(formControl);
        },
        throwsA(
          isA<ValidationException>().having((error) => error.message,
              'description', 'Mime types are not defined.'),
        ),
      );
    });

    test(
        'FileMimeType validator returns False (reason: empty mime type array).',
        () async {
      FileMimeType_EmptyMimeTypeArray_Stub stub =
          new FileMimeType_EmptyMimeTypeArray_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      FileMimeType validator = stub.getValidator();

      expect(
        () async {
          await validator.isValid(formControl);
        },
        throwsA(
          isA<ValidationException>().having((error) => error.message,
              'description', 'Mime types are not defined.'),
        ),
      );
    });
  });
}
