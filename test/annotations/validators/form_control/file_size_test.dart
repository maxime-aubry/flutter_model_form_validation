import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import 'stubs/file_size.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > FileSize.', () {
    group('Valid.', () {
      test('File\'s size is allowed.', () async {
        FileSize_FileSizeIsAllowed_Stub stub =
            new FileSize_FileSizeIsAllowed_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('File not provided.', () async {
        FileSize_NoFile_Stub stub = new FileSize_NoFile_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('File\'s size is not allowed.', () async {
        FileSize_FileSizeIsNotAllowed_Stub stub =
            new FileSize_FileSizeIsNotAllowed_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Exceptions.', () {
      test(
          'Throws exception of ValidatorParameterException type when file size is null.',
          () async {
        FileSize_ThrowsValidatorParameterExceptionOnNullSize_Stub stub =
            new FileSize_ThrowsValidatorParameterExceptionOnNullSize_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'File size is not defined.');
      });
    });
  });
}
