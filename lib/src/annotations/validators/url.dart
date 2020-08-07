import 'package:flutter/widgets.dart';
import '../validation_annotation.dart';
import '../../utils/rules.dart';

/// [URL] validator permits you to check that a string value is a valid URL.
/// {@category Metadata}
/// {@subCategory Validators}
class URL extends ValidationAnnotation {
  const URL({
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
    RegExp regExp = new RegExp(Rules.url);
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
