import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_helper.dart';
import 'package:flutter_model_form_validation/src/utils/parsers.dart';

/// [EqualToDateTime] validator permits you to check that a value is equal to the value of another property.
/// {@category Metadata}
/// {@subCategory Validators}
class EqualToDateTime extends ValidationAnnotation<DateTime> {
  const EqualToDateTime({
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
  Future<bool> isValid<TModel>(DateTime value, TModel model) async {
    try {
      DateTime _valueToCompare =
          ValidationHelper.getLinkedProperty<TModel, DateTime>(
                  model, this.valueToCompareOnProperty) ??
              this.valueToCompare.toDateTime();

      bool isValid = _validate(value, _valueToCompare);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(DateTime value, DateTime valueToCompare) {
    if (value == null) return true;
    if (valueToCompare == null) return false;
    return (value.isAtSameMomentAs(valueToCompare));
  }
}
