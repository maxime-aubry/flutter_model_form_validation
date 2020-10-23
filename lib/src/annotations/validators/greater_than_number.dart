import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/form_validator_attribute.dart';
import 'package:flutter_model_form_validation/src/annotations/helpers/validation_helper.dart';

/// [GreaterThanNumber] validator permits you to check that a value is greater than the value of another property.
/// {@category Metadata}
/// {@subCategory Validators}
class GreaterThanNumber extends FormValidatorAttribute<num> {
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
  Future<bool> isValid<TModel>(num value, TModel model) async {
    try {
      num _valueToCompare = ValidationHelper.getLinkedProperty<TModel, num>(
              model, this.valueToCompareOnProperty) ??
          this.valueToCompare;

      bool isValid = _validate(value, _valueToCompare);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(num value, num valueToCompare) {
    if (value == null) return true;
    if (valueToCompare == null) return false;
    return (value > valueToCompare);
  }
}
