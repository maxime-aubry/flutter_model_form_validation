import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import 'stubs/image_size.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > ImageSize.', () {
    group('Valid.', () {
      test('Image has allowed size.', () async {
        ImageSize_ImageSizeIsAllowed_Stub stub =
            new ImageSize_ImageSizeIsAllowed_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('File is null.', () async {
        ImageSize_FileIsNull_Stub stub = new ImageSize_FileIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('Image width is not allowed.', () async {
        ImageSize_ImageWidthIsNotAllowed_Stub stub =
            new ImageSize_ImageWidthIsNotAllowed_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('Image width is not allowed.', () async {
        ImageSize_ImageHeightIsNotAllowed_Stub stub =
            new ImageSize_ImageHeightIsNotAllowed_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote parameters are provided.', () async {
        ImageSize_remoteWidthAndHeightAreProvided_Stub stub =
            new ImageSize_remoteWidthAndHeightAreProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Exceptions.', () {
      test(
          'Throws an exception of ValidatorParameterException type when minWidth is null.',
          () async {
        ImageSize_ThrowsValidatorParameterExceptionOnNullMinWidth_Stub stub =
            new ImageSize_ThrowsValidatorParameterExceptionOnNullMinWidth_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'minWidth is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when maxWidth is null.',
          () async {
        ImageSize_ThrowsValidatorParameterExceptionOnNullMaxWidth_Stub stub =
            new ImageSize_ThrowsValidatorParameterExceptionOnNullMaxWidth_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'maxWidth is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when minHeight is null.',
          () async {
        ImageSize_ThrowsValidatorParameterExceptionOnNullMinHeight_Stub stub =
            new ImageSize_ThrowsValidatorParameterExceptionOnNullMinHeight_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'minHeight is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when maxHeight is null.',
          () async {
        ImageSize_ThrowsValidatorParameterExceptionOnNullMaxHeight_Stub stub =
            new ImageSize_ThrowsValidatorParameterExceptionOnNullMaxHeight_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'maxHeight is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when minWidth is greater than maxWidth.',
          () async {
        ImageSize_ThrowsValidatorParameterExceptionOnMinWidthGreaterThanMaxWidth_Stub
            stub =
            new ImageSize_ThrowsValidatorParameterExceptionOnMinWidthGreaterThanMaxWidth_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'minWidth value is greater than maxWidth value.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when minHeight is greater than maxHeight.',
          () async {
        ImageSize_ThrowsValidatorParameterExceptionOnMinHeightGreaterThanMaxHeight_Stub
            stub =
            new ImageSize_ThrowsValidatorParameterExceptionOnMinHeightGreaterThanMaxHeight_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'minHeight value is greater than maxHeight value.');
      });

      test(
          'Throws an exception of ValidationException type when current file is not an image.',
          () async {
        ImageSize_ThrowsValidationExceptionOnFileIsNotImage_Stub stub =
            new ImageSize_ThrowsValidationExceptionOnFileIsNotImage_Stub();
        expect_exception<ValidationException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'current file is not an image.');
      });
    });
  });
}
