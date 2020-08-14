import 'dart:io';
import 'package:flutter/widgets.dart';
import '../validation_annotation.dart';

/// [FileMimeType] validator permits you to check that a string value is a valid mime type.
/// {@category Metadata}
/// {@subCategory Validators}
class FileMimeType extends ValidationAnnotation {
  const FileMimeType({
    @required this.mimeTypes,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// This is the allowed mime types list.
  final List<String> mimeTypes;

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
      UriData data = UriData.fromBytes(value.readAsBytesSync());
      if (this.mimeTypes.contains(data.mimeType)) return true;
      return false;
    }
    return false;
  }
}
