import 'dart:core';
import 'package:flutter/widgets.dart';
import '../validation_annotation.dart';

/// [Contains] validator permits you to check that a string value contains a specific word.
/// {@category Metadata}
/// {@subCategory Validators}
class Contains extends ValidationAnnotation {
  const Contains({
    @required this.words,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// This is the custom error to return in case of invalidation.
  final List<String> words;

  /// This is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(Object value, TModel model) {
    try {
      if (value is! String) return false;
      return _validate(value);
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(String value) {
    for (String word in this.words) {
      if (!value.contains(word)) return false;
    }
    return true;
  }
}
