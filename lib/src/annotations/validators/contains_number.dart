import 'dart:core';

import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/form_validator_attribute.dart';

/// [ContainsNumber] validator permits you to check that a number value is into an array.
/// {@category Metadata}
/// {@subCategory Validators}
class ContainsNumber extends FormValidatorAttribute<num> {
  const ContainsNumber({
    @required this.items,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [items] is a collection of items to search in number value.
  final List<num> items;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid<TModel>(num value, TModel model) async {
    try {
      bool isValid = _validate(value, this.items);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(num value, List<num> items) {
    if (value == null) return true;
    return items.contains(value);
  }
}
