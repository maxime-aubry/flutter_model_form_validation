import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';

/// [ContainsString] validator permits you to check that a string value is into an array.
/// {@category Metadata}
/// {@subCategory Validators}
class ContainsString extends ValidationAnnotation<String> {
  const ContainsString({
    @required this.items,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [items] is a collection of items to search in String value.
  final List<String> items;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(String value, TModel model) {
    try {
      bool isValid = _validate(value, this.items);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(String value, List<String> items) => items.contains(value);
}
