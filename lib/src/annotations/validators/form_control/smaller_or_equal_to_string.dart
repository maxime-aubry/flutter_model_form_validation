import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

/// [SmallerOrEqualToString] validator permits you to check that a value is smaller or equal to the value of another property.
/// {@category Metadata}
/// {@subCategory Validators}
class SmallerOrEqualToString extends FormValidator<String> {
  const SmallerOrEqualToString({
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
  Future<bool> isValid<TModel extends ModelForm>(
    FormBuilder<TModel> formBuilder,
    FormGroup<ModelForm, ModelForm> formGroup,
    String value,
  ) async {
    try {
      String _valueToCompare = this.getLinkedProperty<TModel, String>(
        formBuilder.group.modelState.model,
        this.valueToCompare,
        this.valueToCompareOnProperty,
      );

      bool isValid = _validate(value, _valueToCompare);
      return isValid;
    } catch (e) {
      throw new ValidationException(
          'An error occurend with validator on from control with validator of type');
    }
  }

  bool _validate(String value, String valueToCompare) {
    if (value == null) return true;
    if (valueToCompare == null) return false;
    return (value.compareTo(valueToCompare) == 0 ||
        value.compareTo(valueToCompare) == -1);
  }
}
