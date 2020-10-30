import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

/// [FileSize] validator permits you to check that a string value is a valid size.
/// {@category Metadata}
/// {@subCategory Validators}
class FileSize extends FormValidatorAnnotation<List<int>> {
  const FileSize({
    @required this.size,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [size] is the allowed size.
  final int size;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid(
    FormBuilderBase formBuilder,
    FormGroupBase formGroup,
    List<int> value,
  ) async {
    try {
      bool isValid = _validate(value);
      return isValid;
    } catch (e) {
      throw new ValidationException(
          'An error occurend with validator on from control with validator of type');
    }
  }

  bool _validate(List<int> value) {
    if (value == null) return true;
    if (value.length <= this.size) return true;
    return false;
  }
}
