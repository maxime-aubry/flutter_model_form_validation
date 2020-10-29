import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

/// [Required] validator permits you to check that a value is provided.
/// {@category Metadata}
/// {@subCategory Validators}
class Required extends FormValidator {
  const Required({
    @required this.error,
  }) : super(criticityLevel: 1, error: error);

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid<TModel extends ModelForm>(
    FormBuilder<TModel> formBuilder,
    FormGroup<ModelForm, ModelForm> formGroup,
    Object value,
  ) async {
    try {
      bool isValid = _validate(value);
      return isValid;
    } catch (e) {
      throw new ValidationException(
          'An error occurend with validator on from control with validator of type');
    }
  }

  bool _validate(Object value) {
    if (value == null) return false;
    if (value is String && value.isEmpty) return false;
    return true;
  }
}
