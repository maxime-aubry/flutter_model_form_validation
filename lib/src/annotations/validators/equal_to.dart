import 'package:flutter/widgets.dart';
import '../validation_annotation.dart';
import '../validation_helper.dart';

/// [EqualTo] validator permits you to check that a value is equal to the value of another property.
/// {@category Metadata}
/// {@subCategory Validators}
class EqualTo extends ValidationAnnotation {
  const EqualTo({
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
      else if (value is num)
        return _validateNumber(value, valueToCompare);
      else if (value is String) return _validateString(value, valueToCompare);
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validateDatetime(DateTime value, Object valueToCompare) {
    if (valueToCompare is DateTime) {
      if (value.compareTo(valueToCompare) == 0) return true;
      return false;
    }
    return false;
  }

  bool _validateNumber(num value, Object valueToCompare) {
    if (valueToCompare is num) {
      if (value.compareTo(valueToCompare) == 0) return true;
      return false;
    }
    return false;
  }

  bool _validateString(String value, Object valueToCompare) {
    if (valueToCompare is String) {
      if (value.compareTo(valueToCompare) == 0) return true;
      return false;
    }
    return false;
  }
}
