import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

/// [Contains] validator permits you to check that a value is into an array. Only datetime, number and string are allowed.
/// {@category Metadata}
/// {@subCategory Validators}
class Contains extends FormValidatorAnnotation {
  const Contains({
    this.items,
    this.itemsOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [items] is a collection of items to search in String value.
  final List<String> items;

  /// [itemsOnProperty] is the name of targeted property that user uses to provide items to compare. This one has priority on [items].
  final String itemsOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid(
    FormBuilderBase fb,
    FormGroupBase fg,
    Object value,
    String formPath,
    String modelFormPath,
  ) async {
    try {
      if (value == null) return true;

      assert(value is DateTime || value is num || value is String,
          'field type must be a datetime, a number or a string');

      if (value is DateTime) {
        bool isValid = this._validateDatetime(
          value: value,
          items: this
              .getRemoteValues<DateTime>(fg, this.itemsOnProperty, this.items),
        );
        return isValid;
      }

      if (value is num) {
        bool isValid = this._validateNumber(
          value: value,
          items:
              this.getRemoteValues<num>(fg, this.itemsOnProperty, this.items),
        );
        return isValid;
      }

      if (value is String) {
        bool isValid = this._validateString(
          value: value,
          items: this
              .getRemoteValues<String>(fg, this.itemsOnProperty, this.items),
        );
        return isValid;
      }

      return false;
    } on RemotePropertyException catch (e) {
      throw e;
    } catch (e) {
      throw new ValidationException(
          'An error occured with validator on form element with validator of type');
    }
  }

  bool _validateDatetime({
    @required DateTime value,
    @required List<DateTime> items,
  }) {
    if (value == null) return true;
    return items.contains(value);
  }

  bool _validateNumber({
    @required num value,
    @required List<num> items,
  }) {
    if (value == null) return true;
    return items.contains(value);
  }

  bool _validateString({
    @required String value,
    @required List<String> items,
  }) {
    if (value == null) return true;
    return items.contains(value);
  }
}
