import 'package:flutter/widgets.dart';
import '../validation_annotation.dart';

/// [RegularExpression] validator permits you to check that a string value is accordance with provided regular expression.
/// {@category Metadata}
/// {@subCategory Validators}
class RegularExpression extends ValidationAnnotation {
  const RegularExpression({
    @required this.expression,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// This is the regular expression to use.
  final String expression;

  /// This is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(Object value, TModel model) {
    try {
      if (value is! String) return false;
      return _validate(value);
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
