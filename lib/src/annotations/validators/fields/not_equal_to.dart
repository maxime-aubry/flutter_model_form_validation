import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

/// [NotEqualTo] validator permits you to check that a value is not equal to the value of another property. Only datetime, number and string are allowed.
/// {@category Metadata}
/// {@subCategory Validators}
class NotEqualTo extends FormValidatorAnnotation {
  const NotEqualTo({
    this.valueToCompare,
    this.valueToCompareOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [valueToCompare] is default value to compare.
  final String valueToCompare;

  /// [valueToCompareOnProperty] is the name of targeted property that user uses to provide value to compare. This one has priority on [valueToCompare].
  final String valueToCompareOnProperty;

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
          valueToCompare: this.getRemoteValue<DateTime>(
              fg, this.valueToCompareOnProperty, this.valueToCompare),
        );
        return isValid;
      }

      if (value is num) {
        bool isValid = this._validateNumber(
          value: value,
          valueToCompare: this.getRemoteValue<num>(
              fg, this.valueToCompareOnProperty, this.valueToCompare),
        );
        return isValid;
      }

      if (value is String) {
        bool isValid = this._validateString(
          value: value,
          valueToCompare: this.getRemoteValue<String>(
              fg, this.valueToCompareOnProperty, this.valueToCompare),
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
    @required DateTime valueToCompare,
  }) {
    if (value == null) return true;
    if (valueToCompare == null) return false;
    return (!value.isAtSameMomentAs(valueToCompare));
  }

  bool _validateNumber({
    @required num value,
    @required num valueToCompare,
  }) {
    if (value == null) return true;
    if (valueToCompare == null) return false;
    return (value.compareTo(valueToCompare) != 0);
  }

  bool _validateString({
    @required String value,
    @required String valueToCompare,
  }) {
    if (value == null) return true;
    if (valueToCompare == null) return false;
    return (value.compareTo(valueToCompare) != 0);
  }
}
