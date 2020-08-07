import 'package:flutter/widgets.dart';

/// This class provides a error report in case of no-validation of the current model or property.
/// {@category Validation error}
class ValidationError {
  ValidationError({
    @required this.propertyName,
    @required this.validatorType,
    @required this.error,
  });

  /// This is the name of current property to validate.
  final String propertyName;

  /// This is the validator type (Required, EqualTo, GreaterThan...)
  final Type validatorType;

  /// This is the error to display (provided by developers).
  final String error;
}
