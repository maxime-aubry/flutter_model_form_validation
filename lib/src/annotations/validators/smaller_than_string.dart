import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_helper.dart';

/// [SmallerThanString] validator permits you to check that a value is smaller than the value of another property.
/// {@category Metadata}
/// {@subCategory Validators}
class SmallerThanString extends ValidationAnnotation<String> {
  const SmallerThanString({
    this.valueToCompare,
    this.valueToCompareOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [valueToCompare] is default value to compare.
  final String valueToCompare;

  /// [valueToCompareOnProperty] is the name of targeted property that user uses to provide string to compare. This one has priority on [valueToCompare].
  final String valueToCompareOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(String value, TModel model) {
    try {
      String _valueToCompare =
          ValidationHelper.getLinkedProperty<TModel, String>(
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

  bool _validate(String value, String valueToCompare) =>
      (value.compareTo(valueToCompare) == -1);
}
