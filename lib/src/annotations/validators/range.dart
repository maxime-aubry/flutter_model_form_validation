import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

/// [Range] validator permits you to check that a value using by declared settings. Only datetime, number and string are allowed.
/// {@category Metadata}
/// {@subCategory Validators}
class Range extends FormValidatorAnnotation {
  const Range({
    this.min,
    this.max,
    this.minOnProperty,
    this.maxOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [min] is the minimal value of your range.
  final String min;

  /// [max] is the maximal value of your range.
  final String max;

  /// [minOnProperty] is the name of targeted property that user uses to provide minimal value of your range. This one has priority on [min] value.
  final String minOnProperty;

  /// [maxOnProperty] is the name of targeted property that user uses to provide maximal value of your range. This one has priority on [max] value.
  final String maxOnProperty;

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
          minValue:
              this.getRemoteValue<DateTime>(fg, this.minOnProperty, this.min),
          maxValue:
              this.getRemoteValue<DateTime>(fg, this.maxOnProperty, this.max),
        );
        return isValid;
      }

      if (value is num) {
        bool isValid = this._validateNumber(
          value: value,
          minValue: this.getRemoteValue<num>(fg, this.minOnProperty, this.min),
          maxValue: this.getRemoteValue<num>(fg, this.maxOnProperty, this.max),
        );
        return isValid;
      }

      if (value is String) {
        bool isValid = this._validateString(
          value: value,
          minValue:
              this.getRemoteValue<String>(fg, this.minOnProperty, this.min),
          maxValue:
              this.getRemoteValue<String>(fg, this.maxOnProperty, this.max),
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
    @required DateTime minValue,
    @required DateTime maxValue,
  }) {
    if (value == null) return true;
    if (minValue == null || maxValue == null) return false;
    return ((value.isAfter(minValue) || (value.compareTo(minValue) == 0)) &&
        (value.isBefore(maxValue) || (value.compareTo(maxValue) == 0)));
  }

  bool _validateNumber({
    @required num value,
    @required num minValue,
    @required num maxValue,
  }) {
    if (value == null) return true;
    if (minValue == null || maxValue == null) return false;
    return (value >= minValue && value <= maxValue);
  }

  bool _validateString({
    @required String value,
    @required String minValue,
    @required String maxValue,
  }) {
    if (value == null) return true;
    if (minValue == null || maxValue == null) return false;
    return ((value.compareTo(minValue) == 0 ||
            value.compareTo(minValue) == 1) &&
        (value.compareTo(maxValue) == 0 || value.compareTo(maxValue) == -1));
  }
}
