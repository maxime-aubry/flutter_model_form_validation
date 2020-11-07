import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';

/// [Contains] validator permits you to check that a value is into an array. Only datetime, number and string are allowed.
/// {@category Metadata}
/// {@subCategory Validators}
class Contains extends FormValidatorAnnotation {
  const Contains({
    @required this.serviceName,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [serviceName] is the service name that provides items for validators.
  final String serviceName;

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

      if (this.serviceName == null || this.serviceName.isEmpty)
        throw new Exception('Service name is not provided');

      if (value is! DateTime &&
          value is! num &&
          value is! int &&
          value is! double &&
          value is! String)
        throw new Exception('field type must be a datetime, number or string');

      Function f = ServiceProvider.get(this.serviceName);
      List items = await f() as List;

      if (value is List<DateTime> ||
          value is List<num> ||
          value is List<int> ||
          value is List<double> ||
          value is List<String>)
        throw new Exception('items type must be a datetime, number or string');

      if (value is DateTime && items is List<DateTime>) {
        bool isValid = this._validate<DateTime>(
          value: value,
          items: items,
        );
        return isValid;
      }

      if (value is num && items is List<num>) {
        bool isValid = this._validate<num>(
          value: value,
          items: items,
        );
        return isValid;
      }

      if (value is int && items is List<int>) {
        bool isValid = this._validate<int>(
          value: value,
          items: items,
        );
        return isValid;
      }

      if (value is double && items is List<double>) {
        bool isValid = this._validate<double>(
          value: value,
          items: items,
        );
        return isValid;
      }

      if (value is String && items is List<String>) {
        bool isValid = this._validate<String>(
          value: value,
          items: items,
        );
        return isValid;
      }

      throw Exception('Value type and items type are different');
    } on RemotePropertyException catch (e) {
      throw e;
    } catch (e) {
      throw new ValidationException(
          'An error occured with validator on form element with validator of type');
    }
  }

  bool _validate<TValue>({
    @required Object value,
    @required List<Object> items,
  }) {
    if (value == null) return true;
    return items.contains(value);
  }
}
