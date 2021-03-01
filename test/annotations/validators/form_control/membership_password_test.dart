import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../form/reactive_form/parts/initializer/fake_initializer.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > MembershipPassword.',
      () {
    group('Valid.', () {
      test(
          'Password is valid with (minLength: 6, maxLength: 12, includesLowercaseAlphabeticalCharacters: true, includesUppercaseAlphabeticalCharacters: true, includesNumericalCharacters: true, includesSpecialCharacters: true).',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'P@$$w0rd',
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: true,
          includesUppercaseAlphabeticalCharacters: true,
          includesNumericalCharacters: true,
          includesSpecialCharacters: true,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, r'P@$$w0rd');
        expect(validator.minLength, 6);
        expect(validator.maxLength, 12);
        expect(validator.includesLowercaseAlphabeticalCharacters, true);
        expect(validator.includesUppercaseAlphabeticalCharacters, true);
        expect(validator.includesNumericalCharacters, true);
        expect(validator.includesSpecialCharacters, true);
      });

      test(
          'Password is valid with (minLength: 3, maxLength: 3, includesLowercaseAlphabeticalCharacters: true, includesUppercaseAlphabeticalCharacters: false, includesNumericalCharacters: false, includesSpecialCharacters: false).',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'aaa',
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 3,
          maxLength: 3,
          includesLowercaseAlphabeticalCharacters: true,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, r'aaa');
        expect(validator.minLength, 3);
        expect(validator.maxLength, 3);
        expect(validator.includesLowercaseAlphabeticalCharacters, true);
        expect(validator.includesUppercaseAlphabeticalCharacters, false);
        expect(validator.includesNumericalCharacters, false);
        expect(validator.includesSpecialCharacters, false);
      });

      test(
          'Password is valid with (minLength: 3, maxLength: 3, includesLowercaseAlphabeticalCharacters: false, includesUppercaseAlphabeticalCharacters: true, includesNumericalCharacters: false, includesSpecialCharacters: false).',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'AAA',
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 3,
          maxLength: 3,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: true,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, r'AAA');
        expect(validator.minLength, 3);
        expect(validator.maxLength, 3);
        expect(validator.includesLowercaseAlphabeticalCharacters, false);
        expect(validator.includesUppercaseAlphabeticalCharacters, true);
        expect(validator.includesNumericalCharacters, false);
        expect(validator.includesSpecialCharacters, false);
      });

      test(
          'Password is valid with (minLength: 3, maxLength: 3, includesLowercaseAlphabeticalCharacters: false, includesUppercaseAlphabeticalCharacters: false, includesNumericalCharacters: true, includesSpecialCharacters: false).',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'111',
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 3,
          maxLength: 3,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: true,
          includesSpecialCharacters: false,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, r'111');
        expect(validator.minLength, 3);
        expect(validator.maxLength, 3);
        expect(validator.includesLowercaseAlphabeticalCharacters, false);
        expect(validator.includesUppercaseAlphabeticalCharacters, false);
        expect(validator.includesNumericalCharacters, true);
        expect(validator.includesSpecialCharacters, false);
      });

      test(
          'Password is valid with (minLength: 3, maxLength: 3, includesLowercaseAlphabeticalCharacters: false, includesUppercaseAlphabeticalCharacters: false, includesNumericalCharacters: false, includesSpecialCharacters: true).',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'@@@',
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 3,
          maxLength: 3,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: true,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, r'@@@');
        expect(validator.minLength, 3);
        expect(validator.maxLength, 3);
        expect(validator.includesLowercaseAlphabeticalCharacters, false);
        expect(validator.includesUppercaseAlphabeticalCharacters, false);
        expect(validator.includesNumericalCharacters, false);
        expect(validator.includesSpecialCharacters, true);
      });

      test('Password is null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 3,
          maxLength: 3,
          includesLowercaseAlphabeticalCharacters: true,
          includesUppercaseAlphabeticalCharacters: true,
          includesNumericalCharacters: true,
          includesSpecialCharacters: true,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
      });
    });

    /*group('Invalid.', () {
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
    });*/
  });
}
