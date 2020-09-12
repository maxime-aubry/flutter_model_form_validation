import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_helper.dart';

/// [InText] validator permits you to check that a string value is into a text.
/// {@category Metadata}
/// {@subCategory Validators}
class InText extends ValidationAnnotation<String> {
  const InText({
    this.text,
    this.textOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [text] is the text in which user will search keywords.
  final String text;

  /// [textOnProperty] is the name of targeted property in which user will search keywords. This one has priority on [text] value.
  final String textOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(String value, TModel model) {
    try {
      String _text = ValidationHelper.getLinkedProperty<TModel, String>(
              model, this.textOnProperty) ??
          this.text;

      if (_text == null) return false;

      bool isValid = _validate(value.toLowerCase(), _text.toLowerCase());
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(String value, String text) => text.contains(value);
}
