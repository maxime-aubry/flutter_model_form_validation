import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/form_validator.dart';

/// [FileSize] validator permits you to check that a string value is a valid size.
/// {@category Metadata}
/// {@subCategory Validators}
class FileSize extends FormValidator<List<int>> {
  const FileSize({
    @required this.size,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [size] is the allowed size.
  final int size;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid<TModel>(List<int> value, TModel model) async {
    try {
      bool isValid = _validate(value);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(List<int> value) {
    if (value == null) return true;
    if (value.length <= this.size) return true;
    return false;
  }
}
