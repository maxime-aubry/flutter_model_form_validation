import 'package:flutter/widgets.dart';
import '../validation_annotation.dart';

/// [StringLength] validator permits you to check that a string value has a length between two values.
/// {@category Metadata}
/// {@subCategory Validators}
class StringLength extends ValidationAnnotation<String> {
  const StringLength({
    @required this.min,
    @required this.max,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [min] is the minimal number of your string length.
  final int min;

  /// [max] is the maximal number of your string length.
  final int max;

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

  bool _validate(String value) =>
      (value.length >= this.min && value.length <= this.max);
}
