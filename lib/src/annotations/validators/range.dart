import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

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
  }) : super(error: error);

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
    FormGroup root,
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
          minValue:
              this.getRemoteValue<DateTime>(fg, this.minOnProperty, this.min),
          maxValue:
              this.getRemoteValue<DateTime>(fg, this.maxOnProperty, this.max),
        );
        return isValid;
      }

      if (value is num) {
        bool isValid = this._validate<num>(
          value: value,
          minValue: this.getRemoteValue<num>(fg, this.minOnProperty, this.min),
          maxValue: this.getRemoteValue<num>(fg, this.maxOnProperty, this.max),
        );
        return isValid;
      }

      if (value is String) {
        bool isValid = this._validate<String>(
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

  bool _validate<TValue extends Comparable>({
    @required TValue value,
    @required TValue minValue,
    @required TValue maxValue,
  }) {
    if (value == null) return true;
    if (minValue == null || maxValue == null) return false;
    int comparison_of_min = value.compareTo(minValue);
    int comparison_of_max = value.compareTo(maxValue);
    bool isValid = (comparison_of_min >= 0 && comparison_of_max <= 0);
    return isValid;
  }
}
