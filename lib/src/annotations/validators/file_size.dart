import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';

/// [FileSize] validator permits you to check that a string value is a valid size.
/// {@category Metadata}
/// {@subCategory Validators}
class FileSize extends ValidationAnnotation<File> {
  const FileSize({
    @required this.size,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [size] is the allowed size.
  final int size;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(File value, TModel model) {
    try {
      bool isValid = _validate(value);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(File value) {
    if (value != null && value.existsSync()) {
      int fileLength = value.lengthSync();
      if (fileLength <= this.size) return true;
      return false;
    }
    return false;
  }
}
