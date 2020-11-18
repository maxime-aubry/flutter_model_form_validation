import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

/// [EqualTo] validator permits you to check that a value is equal to the value of another property. Only datetime, number and string are allowed.
/// {@category Metadata}
/// {@subCategory Validators}
class EqualTo extends FormValidatorAnnotation {
  const EqualTo({
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
    FormBuilder fb,
    FormGroup fg,
    Object value,
    String formPath,
    String modelFormPath,
  ) async {
    try {
      if (value == null) return true;

      if (value is! DateTime &&
          value is! num &&
          value is! int &&
          value is! double &&
          value is! String)
        throw new Exception(
            'field type must be a datetime, a number or a string');

      if (value is DateTime) {
        bool isValid = this._validate<DateTime>(
          value: value,
          valueToCompare: this.getRemoteValue<DateTime>(
              fg, this.valueToCompareOnProperty, this.valueToCompare),
        );
        return isValid;
      }

      if (value is num) {
        bool isValid = this._validate<num>(
          value: value,
          valueToCompare: this.getRemoteValue<num>(
              fg, this.valueToCompareOnProperty, this.valueToCompare),
        );
        return isValid;
      }

      if (value is int) {
        bool isValid = this._validate<int>(
          value: value,
          valueToCompare: this.getRemoteValue<int>(
              fg, this.valueToCompareOnProperty, this.valueToCompare),
        );
        return isValid;
      }

      if (value is double) {
        bool isValid = this._validate<double>(
          value: value,
          valueToCompare: this.getRemoteValue<double>(
              fg, this.valueToCompareOnProperty, this.valueToCompare),
        );
        return isValid;
      }

      if (value is String) {
        bool isValid = this._validate<String>(
          value: value,
          valueToCompare: this.getRemoteValue<String>(
              fg, this.valueToCompareOnProperty, this.valueToCompare),
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

  bool _validate<TValue extends Comparable>({
    @required TValue value,
    @required TValue valueToCompare,
  }) {
    if (value == null) return true;
    if (valueToCompare == null) return false;
    int comparison = value.compareTo(valueToCompare);
    bool isValid = (comparison == 0);
    return isValid;
  }
}
