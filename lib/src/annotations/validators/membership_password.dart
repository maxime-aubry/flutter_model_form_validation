import 'package:flutter/widgets.dart';
import '../validation_annotation.dart';

/// [MembershipPassword] validator permits you to check that a string value is accordance with declared settings.
/// You must set to true at least one options. In the other case, your validator will always return false.
/// {@category Metadata}
/// {@subCategory Validators}
class MembershipPassword extends ValidationAnnotation {
  const MembershipPassword({
    @required this.minLength,
    @required this.maxLength,
    @required this.includesAlphabeticalCharacters,
    @required this.includesUppercaseCharacters,
    @required this.includesNumericalCharacters,
    @required this.includesSpecialCharacters,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// This is the minimal string length of your password.
  final int minLength;

  /// This is the maximal string length of your password.
  final int maxLength;

  /// If true, forces to add alphabetical characters to the password.
  final bool includesAlphabeticalCharacters;

  /// If true, forces to add uppercase characters to the password.
  final bool includesUppercaseCharacters;

  /// If true, forces to add numerical characters to the password.
  final bool includesNumericalCharacters;

  /// If true, forces to add special characters to the password.
  final bool includesSpecialCharacters;

  /// This is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(Object value, TModel model) {
    try {
      if (!this.includesAlphabeticalCharacters &&
          !this.includesUppercaseCharacters &&
          !this.includesNumericalCharacters &&
          !this.includesSpecialCharacters) return false;
      if (value is! String) return false;
      return _validate(value);
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(String value) {
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
