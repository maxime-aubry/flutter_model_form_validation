import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

/// [InText] validator permits you to check that a string value is into a text.
/// {@category Metadata}
/// {@subCategory Validators}
class InText extends FormValidatorAnnotation {
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
  Future<bool> isValid(
    FormBuilder fb,
    FormGroup fg,
    Object value,
    String formPath,
    String modelFormPath,
  ) async {
    try {
      if (value == null) return true;

      if (value is! String) throw new Exception('field type must be a string');

      bool isValid = _validate(
        value: (value as String)?.toLowerCase(),
        text: this
            .getRemoteValue<String>(fg, this.textOnProperty, this.text)
            ?.toLowerCase(),
      );
      return isValid;
    } on RemotePropertyException catch (e) {
      throw e;
    } catch (e) {
      throw new ValidationException(
          'An error occured with validator on form element with validator of type');
    }
  }

  bool _validate({
    @required String value,
    @required String text,
  }) {
    if (value == null) return true;
    if (text == null) return false;
    return text.contains(value);
  }
}
