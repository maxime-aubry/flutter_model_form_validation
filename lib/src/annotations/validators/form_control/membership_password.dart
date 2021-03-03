import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class PasswordSettings {
  final int minLength;
  final int maxLength;
  final bool includesLowercaseAlphabeticalCharacters;
  final bool includesUppercaseAlphabeticalCharacters;
  final bool includesNumericalCharacters;
  final bool includesSpecialCharacters;

  PasswordSettings(
    this.minLength,
    this.maxLength,
    this.includesLowercaseAlphabeticalCharacters,
    this.includesUppercaseAlphabeticalCharacters,
    this.includesNumericalCharacters,
    this.includesSpecialCharacters,
  );
}

abstract class IPasswordCheckRule {
  String name;

  bool checkRule(String value, PasswordSettings settings);
}

class PasswordCheckMinLength implements IPasswordCheckRule {
  @override
  String name = 'minLength';

  @override
  bool checkRule(String value, PasswordSettings settings) =>
      value.length >= settings.minLength;
}

class PasswordCheckMaxLength implements IPasswordCheckRule {
  @override
  String name = 'maxLength';

  @override
  bool checkRule(String value, PasswordSettings settings) =>
      value.length <= settings.maxLength;
}

class PasswordCheckLowercaseAlphabeticalCharacters
    implements IPasswordCheckRule {
  @override
  String name = 'includesLowercaseAlphabeticalCharacters';

  @override
  bool checkRule(String value, PasswordSettings settings) {
    String expression = r'[a-z]';
    RegExp regExp = new RegExp(expression);
    if (regExp.hasMatch(value.toString())) return true;
    return false;
  }
}

class PasswordCheckUppercaseAlphabeticalCharacters
    implements IPasswordCheckRule {
  @override
  String name = 'includesUppercaseAlphabeticalCharacters';

  @override
  bool checkRule(String value, PasswordSettings settings) {
    String expression = r'[A-Z]';
    RegExp regExp = new RegExp(expression);
    if (regExp.hasMatch(value.toString())) return true;
    return false;
  }
}

class PasswordCheckNumericalCharacters implements IPasswordCheckRule {
  @override
  String name = 'includesNumericalCharacters';

  @override
  bool checkRule(String value, PasswordSettings settings) {
    String expression = r'[\d]';
    RegExp regExp = new RegExp(expression);
    if (regExp.hasMatch(value.toString())) return true;
    return false;
  }
}

class PasswordCheckSpecialCharacters implements IPasswordCheckRule {
  @override
  String name = 'includesSpecialCharacters';

  @override
  bool checkRule(String value, PasswordSettings settings) {
    String expression = r'[@$!%*?&]';
    RegExp regExp = new RegExp(expression);
    if (regExp.hasMatch(value.toString())) return true;
    return false;
  }
}

class MembershipPassword extends FormControlValidatorAnnotation<String> {
  /* Public properties */
  /// [minLength] is the minimal string length of your password.
  final int minLength;

  /// [maxLength] is the maximal string length of your password.
  final int maxLength;

  /// [includesLowercaseAlphabeticalCharacters] forces to add alphabetical characters to the password.
  final bool includesLowercaseAlphabeticalCharacters;

  /// [includesUppercaseAlphabeticalCharacters] forces to add uppercase characters to the password.
  final bool includesUppercaseAlphabeticalCharacters;

  /// [includesNumericalCharacters] forces to add numerical characters to the password.
  final bool includesNumericalCharacters;

  /// [includesSpecialCharacters] forces to add special characters to the password.
  final bool includesSpecialCharacters;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const MembershipPassword({
    @required this.minLength,
    @required this.maxLength,
    this.includesLowercaseAlphabeticalCharacters = false,
    this.includesUppercaseAlphabeticalCharacters = false,
    this.includesNumericalCharacters = false,
    this.includesSpecialCharacters = false,
    String error,
  }) : super(error: error);

  /* Public methods */
  @override
  Future<bool> isValid(FormControl<String> control) async {
    this._validateParameters();
    bool isValid = await this._validate(control.value);
    return isValid;
  }

  /// [getErrorDetails] provides error details. For each option, specify if it's a success or a failure.
  /// // How to use it ?
  /// '''dart
  /// FormControl<String> formControl; // get it...
  /// MembershipPassword validator = formControl.getValidator<MembershipPassword>();
  /// Map<String, bool> details = validator.getErrorDetails('azerty');
  /// '''
  Map<String, bool> getErrorDetails(String value) {
    try {
      Map<String, bool> details = Map<String, bool>();

      PasswordSettings settings = new PasswordSettings(
        this.minLength,
        this.maxLength,
        this.includesLowercaseAlphabeticalCharacters,
        this.includesUppercaseAlphabeticalCharacters,
        this.includesNumericalCharacters,
        this.includesSpecialCharacters,
      );

      for (IPasswordCheckRule rule in this._getRules())
        details[rule.name] = rule.checkRule(value, settings);

      return details;
    } catch (e) {
      return Map<String, bool>();
    }
  }

  /* Protected methods */

  /* Private methods */
  void _validateParameters() {
    if (this.minLength == null)
      throw new ValidatorParameterException('minLength is not defined.');

    if (this.maxLength == null)
      throw new ValidatorParameterException('maxLength is not defined.');

    if (this.minLength.compareTo(this.maxLength) > 0)
      throw new ValidatorParameterException(
          'minLength value is greater than maxLength value.');

    if (this.includesLowercaseAlphabeticalCharacters == null)
      throw new ValidatorParameterException(
          'includesLowercaseAlphabeticalCharacters is not defined.');

    if (this.includesUppercaseAlphabeticalCharacters == null)
      throw new ValidatorParameterException(
          'includesUppercaseAlphabeticalCharacters is not defined.');

    if (this.includesNumericalCharacters == null)
      throw new ValidatorParameterException(
          'includesNumericalCharacters is not defined.');

    if (this.includesSpecialCharacters == null)
      throw new ValidatorParameterException(
          'includesSpecialCharacters is not defined.');
  }

  bool _validate(String value) {
    if (value == null || value.isEmpty) return true;

    PasswordSettings settings = new PasswordSettings(
      this.minLength,
      this.maxLength,
      this.includesLowercaseAlphabeticalCharacters,
      this.includesUppercaseAlphabeticalCharacters,
      this.includesNumericalCharacters,
      this.includesSpecialCharacters,
    );

    for (IPasswordCheckRule rule in this._getRules()) {
      if (!rule.checkRule(value, settings)) return false;
    }

    return true;
  }

  List<IPasswordCheckRule> _getRules() {
    List<IPasswordCheckRule> rules = [];

    rules.add(new PasswordCheckMinLength());
    rules.add(new PasswordCheckMaxLength());

    if (this.includesLowercaseAlphabeticalCharacters)
      rules.add(new PasswordCheckLowercaseAlphabeticalCharacters());

    if (this.includesUppercaseAlphabeticalCharacters)
      rules.add(new PasswordCheckUppercaseAlphabeticalCharacters());

    if (this.includesNumericalCharacters)
      rules.add(new PasswordCheckNumericalCharacters());

    if (this.includesSpecialCharacters)
      rules.add(new PasswordCheckSpecialCharacters());

    return rules;
  }
}
