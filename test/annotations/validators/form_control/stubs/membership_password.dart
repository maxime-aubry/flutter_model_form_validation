import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../stubs.dart';

class _MembershipPasswordStub
    extends ValidatorStub<FormControl<String>, MembershipPassword> {
  _MembershipPasswordStub({
    String value,
    int localMinLength,
    int localMaxLength,
    bool localIncludesAlphabeticalCharacters,
    bool localIncludesUppercaseCharacters,
    bool localIncludesNumericalCharacters,
    bool localIncludesSpecialCharacters,
  }) : super() {
    super.control = new FormControl<String>(
      value: value,
      validators: [],
    );
    super.validator = MembershipPassword(
      minLength: localMinLength,
      maxLength: localMaxLength,
      includesAlphabeticalCharacters: localIncludesAlphabeticalCharacters,
      includesUppercaseCharacters: localIncludesUppercaseCharacters,
      includesNumericalCharacters: localIncludesNumericalCharacters,
      includesSpecialCharacters: localIncludesSpecialCharacters,
      error: null,
    );
  }
}

/* Value is valid */
class MembershipPassword_PasswordIsValid_Stub extends _MembershipPasswordStub {
  MembershipPassword_PasswordIsValid_Stub()
      : super(
          value: 'P@\$\$w0rd',
          localMinLength: 6,
          localMaxLength: 12,
          localIncludesAlphabeticalCharacters: true,
          localIncludesUppercaseCharacters: true,
          localIncludesNumericalCharacters: true,
          localIncludesSpecialCharacters: true,
        );
}

class MembershipPassword_PasswordIsNull_Stub extends _MembershipPasswordStub {
  MembershipPassword_PasswordIsNull_Stub()
      : super(
          value: null,
          localMinLength: 6,
          localMaxLength: 12,
          localIncludesAlphabeticalCharacters: true,
          localIncludesUppercaseCharacters: true,
          localIncludesNumericalCharacters: true,
          localIncludesSpecialCharacters: true,
        );
}

/* Value is not valid */
class MembershipPassword_PasswordIsNotValid_Stub
    extends _MembershipPasswordStub {
  MembershipPassword_PasswordIsNotValid_Stub()
      : super(
          value: 'password',
          localMinLength: 6,
          localMaxLength: 12,
          localIncludesAlphabeticalCharacters: true,
          localIncludesUppercaseCharacters: true,
          localIncludesNumericalCharacters: true,
          localIncludesSpecialCharacters: true,
        );
}

/* Remote parameters are provided */

/* Exceptions on parameters */
class MembershipPassword_ThrowsValidatorParameterExceptionOnMinLengthGreaterThanMaxHLength_Stub
    extends _MembershipPasswordStub {
  MembershipPassword_ThrowsValidatorParameterExceptionOnMinLengthGreaterThanMaxHLength_Stub()
      : super(
          localMinLength: 12,
          localMaxLength: 6,
        );
}
