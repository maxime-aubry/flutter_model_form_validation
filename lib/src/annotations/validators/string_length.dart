import 'package:flutter/widgets.dart';
import '../validation_annotation.dart';

/// [StringLength] validator permits you to check that a string value has a length between two values.
/// {@category Metadata}
/// {@subCategory Validators}
class StringLength extends ValidationAnnotation {
  const StringLength({
    @required this.min,
    @required this.max,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// This is the minimal number of your string length.
  final int min;

  /// This is the maximal number of your string length.
  final int max;

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
    if (value.length >= this.min && value.length <= this.max) return true;
    return false;
  }
}
