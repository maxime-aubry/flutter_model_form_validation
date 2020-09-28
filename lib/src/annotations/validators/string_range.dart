import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_helper.dart';

/// [StringRange] validator permits you to check that a string using by declared settings.
/// {@category Metadata}
/// {@subCategory Validators}
class StringRange extends ValidationAnnotation<String> {
  const StringRange({
    this.min,
    this.max,
    this.minOnProperty,
    this.maxOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [min] is the minimal string of your range.
  final String min;

  /// [max] is the maximal string of your range.
  final String max;

  /// [minOnProperty] is the name of targeted property that user uses to provide minimal string of your range. This one has priority on [min] value.
  final String minOnProperty;

  /// [maxOnProperty] is the name of targeted property that user uses to provide maximal string of your range. This one has priority on [max] value.
  final String maxOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid<TModel>(String value, TModel model) async {
    try {
      String _min = ValidationHelper.getLinkedProperty<TModel, String>(
              model, this.minOnProperty) ??
          this.min;
      String _max = ValidationHelper.getLinkedProperty<TModel, String>(
              model, this.maxOnProperty) ??
          this.max;

      bool isValid = _validate(value, _min, _max);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(String value, String minValue, String maxValue) {
    if (value == null) return true;
    if (minValue == null || maxValue == null) return false;
    return ((value.compareTo(minValue) == 0 ||
            value.compareTo(minValue) == 1) &&
        (value.compareTo(maxValue) == 0 || value.compareTo(maxValue) == -1));
  }
}
