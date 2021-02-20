import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import 'stubs/membership_password.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > MembershipPassword.',
      () {
    group('Valid.', () {
      test('Password is valid.', () async {
        MembershipPassword_PasswordIsValid_Stub stub =
            new MembershipPassword_PasswordIsValid_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('Password is null.', () async {
        MembershipPassword_PasswordIsNull_Stub stub =
            new MembershipPassword_PasswordIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('Password is not valid.', () async {
        MembershipPassword_PasswordIsNotValid_Stub stub =
            new MembershipPassword_PasswordIsNotValid_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Exceptions.', () {
      test(
          'Throws an exception of ValidatorParameterException type when minLength is null.',
          () async {
        MembershipPassword_ThrowsValidatorParameterExceptionOnMinLengthIsNull_Stub
            stub =
            new MembershipPassword_ThrowsValidatorParameterExceptionOnMinLengthIsNull_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'minLength is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when maxLength is null.',
          () async {
        MembershipPassword_ThrowsValidatorParameterExceptionOnMaxLengthIsNull_Stub
            stub =
            new MembershipPassword_ThrowsValidatorParameterExceptionOnMaxLengthIsNull_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'maxLength is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when minLength is greater than maxLength.',
          () async {
        MembershipPassword_ThrowsValidatorParameterExceptionOnMinLengthGreaterThanMaxLength_Stub
            stub =
            new MembershipPassword_ThrowsValidatorParameterExceptionOnMinLengthGreaterThanMaxLength_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'minLength value is greater than maxLength value.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when includesAlphabeticalCharacters is null.',
          () async {
        MembershipPassword_ThrowsValidatorParameterExceptionOnIncludesAlphabeticalCharactersIsNull_Stub
            stub =
            new MembershipPassword_ThrowsValidatorParameterExceptionOnIncludesAlphabeticalCharactersIsNull_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'includesAlphabeticalCharacters is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when includesUppercaseCharacters is null.',
          () async {
        MembershipPassword_ThrowsValidatorParameterExceptionOnIncludesUppercaseCharactersIsNull_Stub
            stub =
            new MembershipPassword_ThrowsValidatorParameterExceptionOnIncludesUppercaseCharactersIsNull_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'includesUppercaseCharacters is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when includesNumericalCharacters is null.',
          () async {
        MembershipPassword_ThrowsValidatorParameterExceptionOnIncludesNumericalCharactersIsNull_Stub
            stub =
            new MembershipPassword_ThrowsValidatorParameterExceptionOnIncludesNumericalCharactersIsNull_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'includesNumericalCharacters is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when includesSpecialCharacters is null.',
          () async {
        MembershipPassword_ThrowsValidatorParameterExceptionOnIncludesSpecialCharactersIsNull_Stub
            stub =
            new MembershipPassword_ThrowsValidatorParameterExceptionOnIncludesSpecialCharactersIsNull_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'includesSpecialCharacters is not defined.');
      });
    });
  });
}
