import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

/// [ContainsNumber] validator permits you to check that a number value is into an array.
/// {@category Metadata}
/// {@subCategory Validators}
class ContainsNumber extends FormValidatorAnnotation<num> {
  const ContainsNumber({
    @required this.items,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [items] is a collection of items to search in number value.
  final List<num> items;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid(
    FormBuilder formBuilder,
    FormGroup formGroup,
    num value,
  ) async {
    try {
      bool isValid = _validate(value, this.items);
      return isValid;
    } catch (e) {
      throw new ValidationException(
          'An error occurend with validator on from control with validator of type');
    }
  }

  bool _validate(num value, List<num> items) {
    if (value == null) return true;
    return items.contains(value);
  }
}
