import 'package:flutter/widgets.dart';
import '../validation_annotation.dart';

/// [DateTimeRange] validator permits you to check that a datetime using by declared settings.
/// {@category Metadata}
/// {@subCategory Validators}
class DateTimeRange extends ValidationAnnotation {
  const DateTimeRange({
    @required this.min,
    @required this.max,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// This is the minimal datetime of your range.
  final String min;

  /// This is the maximal datetime of your range.
  final String max;

  /// This is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(Object value, TModel model) {
    try {
      if (value == null) return true;

      DateTime minDate = (this.min == null || this.min.isEmpty)
          ? DateTime.parse('0001-01-01T00:00:00')
          : DateTime.parse(this.min);
      DateTime maxDate = (this.max == null || this.max.isEmpty)
          ? DateTime.parse('9999-12-31T23:59:59')
          : DateTime.parse(this.max);

      if (value is DateTime) return _validate(value, minDate, maxDate);
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(DateTime value, DateTime minDate, DateTime maxDate) {
    if ((value.isAfter(minDate) || (value.compareTo(minDate) == 0)) &&
        (value.isBefore(maxDate) || (value.compareTo(maxDate) == 0)))
      return true;
    return false;
  }
}

/// [NumberRange] validator permits you to check that a number using by declared settings.
/// {@category Metadata}
/// {@subCategory Validators}
class NumberRange extends ValidationAnnotation {
  const NumberRange({
    @required this.min,
    @required this.max,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [min] is the minimal number of your range.
  final double min;

  /// [max] is the maximal number of your range.
  final double max;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(Object value, TModel model) {
    try {
      if (value == null) return true;

      if (value is int)
        return _validate(value.toDouble());
      else if (value is double) return _validate(value);
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(double value) {
    if (value >= this.min && value <= this.max) return true;
    return false;
  }
}
