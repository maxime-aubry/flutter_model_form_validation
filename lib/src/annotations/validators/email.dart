import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';
import 'package:flutter_model_form_validation/src/utils/rules.dart';

/// [Email] validator permits you to check that a string value is a valid email.
/// {@category Metadata}
/// {@subCategory Validators}
class Email extends ValidationAnnotation<String> {
  const Email({
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(String value, TModel model) {
    try {
      bool isValid = _validate(value);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(String value) {
    RegExp regExp = new RegExp(Rules.email);
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
