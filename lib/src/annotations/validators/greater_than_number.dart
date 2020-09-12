import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_helper.dart';

/// [GreaterThanNumber] validator permits you to check that a value is greater than the value of another property.
/// {@category Metadata}
/// {@subCategory Validators}
class GreaterThanNumber extends ValidationAnnotation<num> {
  const GreaterThanNumber({
    this.valueToCompare,
    this.valueToCompareOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [valueToCompare] is default value to compare.
  final num valueToCompare;

  /// [valueToCompareOnProperty] is the name of targeted property that user uses to provide number to compare. This one has priority on [valueToCompare].
  final String valueToCompareOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(num value, TModel model) {
    try {
      num _valueToCompare = ValidationHelper.getLinkedProperty<TModel, num>(
              model, this.valueToCompareOnProperty) ??
          this.valueToCompare;

      if (_valueToCompare == null) return false;

      bool isValid = _validate(value, _valueToCompare);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(num value, num valueToCompare) => (value > valueToCompare);
}
