import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_group.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

/// [InText] validator permits you to check that a string value is into a text.
/// {@category Metadata}
/// {@subCategory Validators}
class InText extends FormValidator<String> {
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
  Future<bool> isValid<TModel extends PropertyChangeNotifier<String>>(
    FormBuilder<TModel> formBuilder,
    FormGroup<PropertyChangeNotifier<String>, PropertyChangeNotifier<String>>
        formGroup,
    String value,
  ) async {
    try {
      String _text = this.getLinkedProperty<TModel, String>(
        formBuilder.group.modelState.model,
        this.text,
        this.textOnProperty,
      );

      bool isValid = _validate(value.toLowerCase(), _text.toLowerCase());
      return isValid;
    } catch (e) {
      throw new ValidationException(
          'An error occurend with validator on from control with validator of type');
    }
  }

  bool _validate(String value, String text) {
    if (value == null) return true;
    if (text == null) return false;
    return text.contains(value);
  }
}
