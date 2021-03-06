import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_helper.dart';

/// [NumberRange] validator permits you to check that a number using by declared settings.
/// {@category Metadata}
/// {@subCategory Validators}
class NumberRange extends ValidationAnnotation<num> {
  const NumberRange({
    this.min,
    this.max,
    this.minOnProperty,
    this.maxOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [min] is the minimal number of your range.
  final num min;

  /// [max] is the maximal number of your range.
  final num max;

  /// [minOnProperty] is the name of targeted property that user uses to provide minimal number of your range. This one has priority on [min] value.
  final String minOnProperty;

  /// [maxOnProperty] is the name of targeted property that user uses to provide maximal number of your range. This one has priority on [max] value.
  final String maxOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(num value, TModel model) {
    try {
      num _min = ValidationHelper.getLinkedProperty<TModel, num>(
              model, this.minOnProperty) ??
          this.min;
      num _max = ValidationHelper.getLinkedProperty<TModel, num>(
              model, this.maxOnProperty) ??
          this.max;

      if (_min == null || _max == null) return false;

      bool isValid = _validate(value, _min, _max);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(num value, num minValue, num maxValue) =>
      (value >= minValue && value <= maxValue);
}
