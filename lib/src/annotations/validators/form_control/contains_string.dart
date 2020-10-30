import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

/// [ContainsString] validator permits you to check that a string value is into an array.
/// {@category Metadata}
/// {@subCategory Validators}
class ContainsString extends FormValidatorAnnotation<String> {
  const ContainsString({
    @required this.items,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [items] is a collection of items to search in String value.
  final List<String> items;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid(
    FormBuilder formBuilder,
    FormGroup formGroup,
    String value,
  ) async {
    try {
      bool isValid = _validate(value, this.items);
      return isValid;
    } catch (e) {
      throw new ValidationException(
          'An error occurend with validator on from control with validator of type');
    }
  }

  bool _validate(String value, List<String> items) {
    if (value == null) return true;
    return items.contains(value);
  }
}
