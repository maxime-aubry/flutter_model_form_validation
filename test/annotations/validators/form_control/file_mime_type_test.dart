import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import 'stubs/file_mime_type.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > FileMimeType.',
      () {
    group('Valid.', () {
      test('File\'s mime type is allowed.', () async {
        FileMimeType_MimeTypeIsAllowed_Stub stub =
            new FileMimeType_MimeTypeIsAllowed_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('File not provided.', () async {
        FileMimeType_NoFile_Stub stub = new FileMimeType_NoFile_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('File\'s mime type is not allowed.', () async {
        FileMimeType_MimeTypeIsNotAllowed_Stub stub =
            new FileMimeType_MimeTypeIsNotAllowed_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {});

    group('Exceptions.', () {
      test(
          'Throws exception of ValidatorParameterException type when mimeType array is null.',
          () async {
        FileMimeType_ThrowsValidatorParameterExceptionOnNullMimeTypesArray_Stub
            stub =
            new FileMimeType_ThrowsValidatorParameterExceptionOnNullMimeTypesArray_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'Mime types are not defined.');
      });

      test(
          'Throws exception of ValidatorParameterException type when mimeType array is empty.',
          () async {
        FileMimeType_ThrowsValidatorParameterExceptionOnEmptyMimeTypesArray_Stub
            stub =
            new FileMimeType_ThrowsValidatorParameterExceptionOnEmptyMimeTypesArray_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'Mime types are not defined.');
      });
    });
  });
}
