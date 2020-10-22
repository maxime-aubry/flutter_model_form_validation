import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/form_validator.dart';
import 'package:flutter_model_form_validation/src/annotations/helpers/validation_helper.dart';

/// [EqualToString] validator permits you to check that a value is equal to the value of another property.
/// {@category Metadata}
/// {@subCategory Validators}
class EqualToString extends FormValidator<String> {
  const EqualToString({
    this.valueToCompare,
    this.valueToCompareOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [valueToCompare] is default value to compare.
  final String valueToCompare;

  /// [valueToCompareOnProperty] is the name of targeted property that user uses to provide datetime to compare. This one has priority on [valueToCompare].
  final String valueToCompareOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid<TModel>(String value, TModel model) async {
    try {
      String _valueToCompare =
          ValidationHelper.getLinkedProperty<TModel, String>(
                  model, this.valueToCompareOnProperty) ??
              this.valueToCompare;

      bool isValid = _validate(value, _valueToCompare);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(String value, String valueToCompare) {
    if (value == null) return true;
    if (valueToCompare == null) return false;
    return (value.compareTo(valueToCompare) == 0);
  }
}
