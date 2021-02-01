// import 'package:equatable/equatable.dart';

/// This class provides a error report in case of no-validation of the current model or property.
/// {@category Validation error}
class ValidationError {
  ValidationError(
    this.propertyName,
    this.validatorType,
    this.message,
  );

  /// This is the name of current property to validate.
  final String propertyName;

  /// This is the validator type (Required, EqualTo, GreaterThan...)
  final Type validatorType;

  /// This is the error to display (provided by developers).
  final String message;

  ValidationError copyWith({
    String propertyName,
    Type validatorType,
    String message,
  }) {
    return ValidationError(
      propertyName ?? this.propertyName,
      validatorType ?? this.validatorType,
      message ?? this.message,
    );
  }
}
