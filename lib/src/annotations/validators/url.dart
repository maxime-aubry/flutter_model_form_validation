import 'package:flutter/widgets.dart';

import '../../utils/rules.dart';
import '../form_declarers/form_validator_attribute.dart';

/// [URL] validator permits you to check that a string value is a valid URL.
/// {@category Metadata}
/// {@subCategory Validators}
class URL extends FormValidatorAttribute<String> {
  const URL({
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid<TModel>(String value, TModel model) async {
    try {
      bool isValid = _validate(value);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(String value) {
    if (value == null) return true;

    RegExp regExp = new RegExp(Rules.url);
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
