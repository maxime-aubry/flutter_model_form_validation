import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:property_change_notifier/src/property_change_notifier.dart';
import 'package:queries/collections.dart';

/// [ContainsDateTime] validator permits you to check that a datetime value is into an array.
/// {@category Metadata}
/// {@subCategory Validators}
class ContainsDateTime extends FormValidator<DateTime> {
  const ContainsDateTime({
    @required this.items,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [items] is a collection of items to search in String value.
  final List<String> items;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid<TModel extends PropertyChangeNotifier<String>>(
    FormBuilder<TModel> formBuilder,
    FormGroup<PropertyChangeNotifier<String>, PropertyChangeNotifier<String>>
        formGroup,
    DateTime value,
  ) async {
    try {
      List<DateTime> _items = Collection(this.items)
          .select((item) => DateTime.tryParse(item) ?? null)
          .where((item) => item != null)
          .toList();
      bool isValid = _validate(value, _items);
      return isValid;
    } catch (e) {
      throw new ValidationException(
          'An error occurend with validator on from control with validator of type');
    }
  }

  bool _validate(DateTime value, List<DateTime> items) {
    if (value == null) return true;
    return items.contains(value);
  }
}
