import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

/// [StringLength] validator permits you to check that a string value has a length between two values.
/// {@category Metadata}
/// {@subCategory Validators}
class StringLength extends FormValidator<String> {
  const StringLength({
    @required this.min,
    @required this.max,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [min] is the minimal number of your string length.
  final int min;

  /// [max] is the maximal number of your string length.
  final int max;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid<TModel extends ModelForm>(
    FormBuilder<TModel> formBuilder,
    FormGroup<ModelForm, ModelForm> formGroup,
    String value,
  ) async {
    try {
      bool isValid = _validate(value);
      return isValid;
    } catch (e) {
      throw new ValidationException(
          'An error occurend with validator on from control with validator of type');
    }
  }

  bool _validate(String value) {
    if (value == null) return true;
    return (value.length >= this.min && value.length <= this.max);
  }
}