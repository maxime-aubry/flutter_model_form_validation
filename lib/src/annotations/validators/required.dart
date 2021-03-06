import 'package:flutter/widgets.dart';
import '../validation_annotation.dart';

/// [Required] validator permits you to check that a value is provided.
/// {@category Metadata}
/// {@subCategory Validators}
class Required extends ValidationAnnotation {
  const Required({
    @required this.error,
  }) : super(criticityLevel: 1, error: error);

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(Object value, TModel model) {
    bool isValid = _validate(value);
    return isValid;
  }

  bool _validate(Object value) {
    if (value == null) return false;
    if (value is String && value.isEmpty) return false;
    return true;
  }
}
