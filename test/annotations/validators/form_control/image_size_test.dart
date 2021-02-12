import 'dart:typed_data';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/image_size.dart';

void main() {
  setUp(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('ImageSize.', () {
    test('ImageSize validator returns True (reason: allowed image size).',
        () async {
      ImageSize_AllowedImageSize_Stub stub =
          new ImageSize_AllowedImageSize_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      ImageSize validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('ImageSize validator returns True (reason: no file).', () async {
      ImageSize_NoFile_Stub stub = new ImageSize_NoFile_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      ImageSize validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('ImageSize validator returns False (reason: unallowed image width).', () async {
      ImageSize_UnallowedImageWidth_Stub stub = new ImageSize_UnallowedImageWidth_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      ImageSize validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });

    test('ImageSize validator returns False (reason: unallowed image height).', () async {
      ImageSize_UnallowedImageHeight_Stub stub = new ImageSize_UnallowedImageHeight_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      ImageSize validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isFalse);
    });

    test('ImageSize validator throws an exception (reason: missing min width).', () async {
      ImageSize_NullImageMinWidth_Stub stub = new ImageSize_NullImageMinWidth_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      ImageSize validator = stub.getValidator();
      
      expect(
        () async {
          await validator.isValid(formControl);
        },
        throwsA(
          isA<ValidationException>().having((error) => error.message,
              'description', 'Min width is not defined.'),
        ),
      );
    });

    test('ImageSize validator throws an exception (reason: missing max width).', () async {
      ImageSize_NullImageMaxWidth_Stub stub = new ImageSize_NullImageMaxWidth_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      ImageSize validator = stub.getValidator();
      
      expect(
        () async {
          await validator.isValid(formControl);
        },
        throwsA(
          isA<ValidationException>().having((error) => error.message,
              'description', 'Max width is not defined.'),
        ),
      );
    });

    test('ImageSize validator throws an exception (reason: missing min height).', () async {
      ImageSize_NullImageMinHeight_Stub stub = new ImageSize_NullImageMinHeight_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      ImageSize validator = stub.getValidator();
      
      expect(
        () async {
          await validator.isValid(formControl);
        },
        throwsA(
          isA<ValidationException>().having((error) => error.message,
              'description', 'Min height is not defined.'),
        ),
      );
    });

    test('ImageSize validator throws an exception (reason: missing max height).', () async {
      ImageSize_NullImageMaxHeight_Stub stub = new ImageSize_NullImageMaxHeight_Stub();
      FormControl<Uint8List> formControl = stub.getControl();
      ImageSize validator = stub.getValidator();
      
      expect(
        () async {
          await validator.isValid(formControl);
        },
        throwsA(
          isA<ValidationException>().having((error) => error.message,
              'description', 'Max height is not defined.'),
        ),
      );
    });
  });
}
