import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';

/// [RegularExpression] validator permits you to check that a string value is accordance with provided regular expression.
/// {@category Metadata}
/// {@subCategory Validators}
class RegularExpression extends ValidationAnnotation<String> {
  const RegularExpression({
    @required this.expression,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [expression] is the regular expression to use.
  final String expression;

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
    RegExp regExp = new RegExp(this.expression);
    if (regExp.hasMatch(value.toString())) return true;
    return false;
  }
}
