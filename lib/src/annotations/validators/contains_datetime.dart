import 'dart:core';

import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/form_validator_attribute.dart';
import 'package:queries/collections.dart';

/// [ContainsDateTime] validator permits you to check that a datetime value is into an array.
/// {@category Metadata}
/// {@subCategory Validators}
class ContainsDateTime extends FormValidatorAttribute<DateTime> {
  const ContainsDateTime({
    @required this.items,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [items] is a collection of items to search in String value.
  final List<String> items;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid<TModel>(DateTime value, TModel model) async {
    try {
      List<DateTime> _items = Collection(this.items)
          .select((item) => DateTime.tryParse(item) ?? null)
          .where((item) => item != null)
          .toList();
      bool isValid = _validate(value, _items);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(DateTime value, List<DateTime> items) {
    if (value == null) return true;
    return items.contains(value);
  }
}
