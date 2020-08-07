import 'dart:io';
import 'package:flutter/widgets.dart';
import '../validation_annotation.dart';

/// [FileSize] validator permits you to check that a string value is a valid size.
/// {@category Metadata}
/// {@subCategory Validators}
class FileSize extends ValidationAnnotation {
  const FileSize({
    @required this.size,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// This is the allowed size.
  final int size;

  /// This is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(Object value, TModel model) {
    try {
      if (value is! File) return false;
      return _validate(value);
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
