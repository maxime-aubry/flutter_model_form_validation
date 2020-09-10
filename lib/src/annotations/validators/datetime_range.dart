import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_helper.dart';
import 'package:flutter_model_form_validation/src/utils/parsers.dart';

/// [DateTimeRange] validator permits you to check that a datetime using by declared settings.
/// {@category Metadata}
/// {@subCategory Validators}
class DateTimeRange extends ValidationAnnotation<DateTime> {
  const DateTimeRange({
    this.min,
    this.max,
    this.minOnProperty,
    this.maxOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [min] is the minimal datetime of your range.
  final String min;

  /// [max] is the maximal datetime of your range.
  final String max;

  /// [minOnProperty] is the name of targeted property that user uses to provide minimal datetime of your range. This one has priority on [min] value.
  final String minOnProperty;

  /// [maxOnProperty] is the name of targeted property that user uses to provide maximal datetime of your range. This one has priority on [max] value.
  final String maxOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(DateTime value, TModel model) {
    try {
      DateTime _min = ValidationHelper.getLinkedProperty<TModel, DateTime>(
              model, this.minOnProperty) ??
          this.min.toDateTime();
      DateTime _max = ValidationHelper.getLinkedProperty<TModel, DateTime>(
              model, this.maxOnProperty) ??
          this.max.toDateTime();

      if (_min == null || _max == null) return false;

      bool isValid = _validate(value, _min, _max);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(DateTime value, DateTime minValue, DateTime maxValue) =>
      ((value.isAfter(minValue) || (value.compareTo(minValue) == 0)) &&
          (value.isBefore(maxValue) || (value.compareTo(maxValue) == 0)));
}
