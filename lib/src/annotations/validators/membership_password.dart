import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

/// [MembershipPassword] validator permits you to check that a string value is accordance with declared settings.
/// You must set to true at least one options. In the other case, your validator will always return false.
/// {@category Metadata}
/// {@subCategory Validators}
class MembershipPassword extends FormValidatorAnnotation {
  const MembershipPassword({
    @required this.minLength,
    @required this.maxLength,
    @required this.includesAlphabeticalCharacters,
    @required this.includesUppercaseCharacters,
    @required this.includesNumericalCharacters,
    @required this.includesSpecialCharacters,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

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

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid(
    FormBuilderBase fb,
    FormGroupBase fg,
    Object value,
    String formPath,
    String modelFormPath,
  ) async {
    try {
      if (value == null) return true;

      assert(value is String, 'field type must be a string');

      bool isValid = _validate(value);
      return isValid;
    } catch (e) {
      throw new ValidationException(
          'An error occurend with validator on from control with validator of type');
    }
  }

  bool _validate(String value) {
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
