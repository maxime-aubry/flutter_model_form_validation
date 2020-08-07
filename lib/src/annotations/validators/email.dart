import 'package:flutter/widgets.dart';
import '../validation_annotation.dart';
import '../../utils/rules.dart';

/// [Email] validator permits you to check that a string value is a valid email.
/// {@category Metadata}
/// {@subCategory Validators}
class Email extends ValidationAnnotation {
  const Email({
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

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
    RegExp regExp = new RegExp(Rules.email);
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
