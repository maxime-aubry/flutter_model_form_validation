import 'package:flutter/widgets.dart';
import '../validation_annotation.dart';
import '../validation_helper.dart';

/// [GreaterOrEqualTo] validator permits you to check that a value is greater or equal to the value of another property.
/// {@category Metadata}
/// {@subCategory Validators}
class GreaterOrEqualTo extends ValidationAnnotation {
  const GreaterOrEqualTo({
    @required this.propertyName,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// This is the name of targeted property.
  final String propertyName;

  /// This is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(Object value, TModel model) {
    try {
      Object valueToCompare =
          ValidationHelper.getLinkedProperty(model, this.propertyName);
      bool defaultValidation =
          ValidationHelper.getDefaultValidation(value, valueToCompare);

      if (defaultValidation != null) return defaultValidation;

      if (value is DateTime)
        return _validateDatetime(value, valueToCompare);
      else if (value is int)
        return _validateNumber(value.toDouble(), valueToCompare);
      else if (value is double) return _validateNumber(value, valueToCompare);
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validateDatetime(DateTime value, Object valueToCompare) {
    if (valueToCompare is DateTime) {
      if (value.isAfter(valueToCompare) ||
          (value.compareTo(valueToCompare) == 0)) return true;
      return false;
    }
    return false;
  }

  bool _validateNumber(double value, Object valueToCompare) {
    if (valueToCompare is int || valueToCompare is double) {
      if (value >= valueToCompare) return true;
      return false;
    }
    return false;
  }
}
