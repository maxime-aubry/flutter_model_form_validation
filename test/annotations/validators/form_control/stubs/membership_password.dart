import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../stub.dart';

class _MembershipPasswordStub extends IStub<FormControl<String>, MembershipPassword> {
  _MembershipPasswordStub({
    String fcValue,
    int minLength,
    int maxLength,
    bool includesAlphabeticalCharacters,
    bool includesUppercaseCharacters,
    bool includesNumericalCharacters,
    bool includesSpecialCharacters,
  }) : super() {
    super.control = new FormControl<String>(
      value: fcValue,
      validators: [],
    );
    super.validator = MembershipPassword(
      minLength: minLength,
      maxLength: maxLength,
      includesAlphabeticalCharacters: includesAlphabeticalCharacters,
      includesUppercaseCharacters: includesUppercaseCharacters,
      includesNumericalCharacters: includesNumericalCharacters,
      includesSpecialCharacters: includesSpecialCharacters,
      error: 'invalid password',
    );
  }
}

/* Value is valid */
class MembershipPassword_PasswordIsValid_Stub extends _MembershipPasswordStub {
  MembershipPassword_PasswordIsValid_Stub() : super(
    fcValue: 'P@\$\$w0rd',
    minLength: 6,
    maxLength: 12,
    includesAlphabeticalCharacters: true,
    includesUppercaseCharacters: true,
    includesNumericalCharacters: true,
    includesSpecialCharacters: true,
  );
}

class MembershipPassword_PasswordIsNull_Stub extends _MembershipPasswordStub {
  MembershipPassword_PasswordIsNull_Stub() : super(
    fcValue: null,
    minLength: 6,
    maxLength: 12,
    includesAlphabeticalCharacters: true,
    includesUppercaseCharacters: true,
    includesNumericalCharacters: true,
    includesSpecialCharacters: true,
  );
}

class MembershipPassword_PasswordIsEmpty_Stub extends _MembershipPasswordStub {
  MembershipPassword_PasswordIsEmpty_Stub() : super(
    fcValue: '',
    minLength: 6,
    maxLength: 12,
    includesAlphabeticalCharacters: true,
    includesUppercaseCharacters: true,
    includesNumericalCharacters: true,
    includesSpecialCharacters: true,
  );
}

/* Value is not valid */
class MembershipPassword_PasswordIsNotValid_Stub extends _MembershipPasswordStub {
  MembershipPassword_PasswordIsNotValid_Stub() : super(
    fcValue: 'password',
    minLength: 6,
    maxLength: 12,
    includesAlphabeticalCharacters: true,
    includesUppercaseCharacters: true,
    includesNumericalCharacters: true,
    includesSpecialCharacters: true,
  );
}

/* Remote parameters are provided */

/* None parameter is provided */
