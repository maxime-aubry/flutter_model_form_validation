import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class MembershipPassword extends FormControlValidatorAnnotation<String> {
  const MembershipPassword({
    @required this.minLength,
    @required this.maxLength,
    this.includesAlphabeticalCharacters = false,
    this.includesUppercaseCharacters = false,
    this.includesNumericalCharacters = false,
    this.includesSpecialCharacters = false,
    String error,
  }) : super(error: error);

  /// [minLength] is the minimal string length of your password.
  final int minLength;

  /// [maxLength] is the maximal string length of your password.
  final int maxLength;

  /// [includesAlphabeticalCharacters] forces to add alphabetical characters to the password.
  final bool includesAlphabeticalCharacters;

  /// [includesUppercaseCharacters] forces to add uppercase characters to the password.
  final bool includesUppercaseCharacters;

  /// [includesNumericalCharacters] forces to add numerical characters to the password.
  final bool includesNumericalCharacters;

  /// [includesSpecialCharacters] forces to add special characters to the password.
  final bool includesSpecialCharacters;

  @override
  Future<bool> isValid(FormControl<String> control) async {
    this._validateParameters();
    bool isValid = await this._validate(control.value);
    return isValid;
  }

  void _validateParameters() {
    if (this.minLength == null)
      throw new ValidatorParameterException('minLength is not defined.');

    if (this.maxLength == null)
      throw new ValidatorParameterException('maxLength is not defined.');

    if (this.includesAlphabeticalCharacters == null)
      throw new ValidatorParameterException(
          'includesAlphabeticalCharacters is not defined.');

    if (this.includesUppercaseCharacters == null)
      throw new ValidatorParameterException(
          'includesUppercaseCharacters is not defined.');

    if (this.includesNumericalCharacters == null)
      throw new ValidatorParameterException(
          'includesNumericalCharacters is not defined.');

    if (this.includesSpecialCharacters == null)
      throw new ValidatorParameterException(
          'includesSpecialCharacters is not defined.');

    if (this.minLength.compareTo(this.maxLength) > 0)
      throw new ValidatorParameterException(
          'minLength value is greater than maxLength value.');
  }

  bool _validate(String value) {
    if (value == null || value.isEmpty) return true;

    if (!this.includesAlphabeticalCharacters &&
        !this.includesUppercaseCharacters &&
        !this.includesNumericalCharacters &&
        !this.includesSpecialCharacters) return false;

    String expression = r'^' +
        (this.includesAlphabeticalCharacters ? r'(?=.*[a-z])' : '') +
        (this.includesAlphabeticalCharacters && this.includesUppercaseCharacters
            ? r'(?=.*[A-Z])'
            : '') +
        (this.includesNumericalCharacters ? r'(?=.*\d)' : '') +
        (this.includesSpecialCharacters ? r'(?=.*[@$!%*?&])' : '') +
        '[' +
        (this.includesAlphabeticalCharacters ? r'a-z' : '') +
        (this.includesAlphabeticalCharacters && this.includesUppercaseCharacters
            ? r'A-Z'
            : '') +
        (this.includesNumericalCharacters ? r'\d' : '') +
        (this.includesSpecialCharacters ? r'@$!%*?&' : '') +
        ']' +
        '{${this.minLength},${this.maxLength}}' +
        r'$';
    RegExp regExp = new RegExp(expression);

    if (regExp.hasMatch(value.toString())) return true;
    return false;
  }

  /// [getErrorDetails] provides error details. For each options, specify if it's a success or a failure.
  static Map<String, bool> getErrorDetails(
      String value,
      int minLength,
      int maxLength,
      bool includesAlphabeticalCharacters,
      bool includesUppercaseCharacters,
      bool includesNumericalCharacters,
      bool includesSpecialCharacters) {
    try {
      Map<String, bool> details = Map<String, bool>();

      if (includesAlphabeticalCharacters) {
        String expression = r'(?=.*[a-z])';
        RegExp regExp = new RegExp(expression);
        if (regExp.hasMatch(value))
          details['includesAlphabeticalCharacters'] = true;
        else
          details['includesAlphabeticalCharacters'] = false;
      }

      if (includesAlphabeticalCharacters && includesUppercaseCharacters) {
        String expression = r'(?=.*[A-Z])';
        RegExp regExp = new RegExp(expression);
        if (regExp.hasMatch(value))
          details['includesUppercaseCharacters'] = true;
        else
          details['includesUppercaseCharacters'] = false;
      }

      if (includesNumericalCharacters) {
        String expression = r'(?=.*\d)';
        RegExp regExp = new RegExp(expression);
        if (regExp.hasMatch(value))
          details['includesNumericalCharacters'] = true;
        else
          details['includesNumericalCharacters'] = false;
      }

      if (includesSpecialCharacters) {
        String expression = r'(?=.*[@$!%*?&])';
        RegExp regExp = new RegExp(expression);
        if (regExp.hasMatch(value))
          details['includesSpecialCharacters'] = true;
        else
          details['includesSpecialCharacters'] = false;
      }

      if (value.length >= minLength)
        details['minLength'] = true;
      else
        details['minLength'] = false;

      if (value.length <= maxLength)
        details['maxLength'] = true;
      else
        details['maxLength'] = false;

      return details;
    } catch (e) {
      return Map<String, bool>();
    }
  }
}
