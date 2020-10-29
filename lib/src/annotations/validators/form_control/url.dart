import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';

/// [URL] validator permits you to check that a string value is a valid URL.
/// {@category Metadata}
/// {@subCategory Validators}
class URL extends FormValidator<String> {
  const URL({
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

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

    RegExp regExp = new RegExp(Rules.url);
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
