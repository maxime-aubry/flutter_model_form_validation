import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';
import 'package:mime/mime.dart';

/// [FileMimeType] validator permits you to check that a string value is a valid mime type.
/// {@category Metadata}
/// {@subCategory Validators}
class FileMimeType extends ValidationAnnotation<List<int>> {
  const FileMimeType({
    @required this.mimeTypes,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [mimeTypes] is the allowed mime types list.
  final List<String> mimeTypes;

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
    String mimeType = lookupMimeType('no-file', headerBytes: value);
    if (this.mimeTypes.contains(mimeType)) return true;
    return false;
  }
}
