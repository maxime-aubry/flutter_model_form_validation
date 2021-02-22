import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import 'stubs/string_length.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > StringLength.',
      () {
    group('Valid.', () {
      test('value\'s length is equal to min.', () async {
        StringLength_ValueLengthIsEqualToMin_Stub stub =
            new StringLength_ValueLengthIsEqualToMin_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value\'s length is equal to max.', () async {
        StringLength_ValueLengthIsEqualToMax_Stub stub =
            new StringLength_ValueLengthIsEqualToMax_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value\'s length is between min and max.', () async {
        StringLength_ValueLengthIsBetweenMinAndMax_Stub stub =
            new StringLength_ValueLengthIsBetweenMinAndMax_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        StringLength_ValueIsNull_Stub stub =
            new StringLength_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value\'s length is smaller than min.', () async {
        StringLength_ValueLengthIsSmallerThanMin_Stub stub =
            new StringLength_ValueLengthIsSmallerThanMin_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value\'s length is greater than max.', () async {
        StringLength_ValueLengthIsGreaterThanMax_Stub stub =
            new StringLength_ValueLengthIsGreaterThanMax_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Exceptions.', () {
      test(
          'Throws an exception of ValidatorParameterException type when min is null.',
          () async {
        StringLength_ThrowsValidatorParameterExceptionOnNullMin_Stub stub =
            new StringLength_ThrowsValidatorParameterExceptionOnNullMin_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'min value is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when max is null.',
          () async {
        StringLength_ThrowsValidatorParameterExceptionOnNullMax_Stub stub =
            new StringLength_ThrowsValidatorParameterExceptionOnNullMax_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'max value is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when min is greater than max.',
          () async {
        StringLength_ThrowsValidatorParameterExceptionOnMinGreaterThanMax_Stub
            stub =
            new StringLength_ThrowsValidatorParameterExceptionOnMinGreaterThanMax_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'min value is greater than max value.');
      });
    });
  });
}
