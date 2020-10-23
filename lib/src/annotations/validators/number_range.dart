import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/form_validator_attribute.dart';
import 'package:flutter_model_form_validation/src/annotations/helpers/validation_helper.dart';

/// [NumberRange] validator permits you to check that a number using by declared settings.
/// {@category Metadata}
/// {@subCategory Validators}
class NumberRange extends FormValidatorAttribute<num> {
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
  Future<bool> isValid<TModel>(num value, TModel model) async {
    try {
      num _min = ValidationHelper.getLinkedProperty<TModel, num>(
              model, this.minOnProperty) ??
          this.min;
      num _max = ValidationHelper.getLinkedProperty<TModel, num>(
              model, this.maxOnProperty) ??
          this.max;

      bool isValid = _validate(value, _min, _max);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(num value, num minValue, num maxValue) {
    if (value == null) return true;
    if (minValue == null || maxValue == null) return false;
    return (value >= minValue && value <= maxValue);
  }
}
