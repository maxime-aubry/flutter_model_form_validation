import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

/// [NumberRange] validator permits you to check that a number using by declared settings.
/// {@category Metadata}
/// {@subCategory Validators}
class NumberRange extends FormValidatorAnnotation<num> {
  const NumberRange({
    this.min,
    this.max,
    this.minOnProperty,
    this.maxOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [min] is the minimal number of your range.
  final num min;

  /// [max] is the maximal number of your range.
  final num max;

  /// [minOnProperty] is the name of targeted property that user uses to provide minimal number of your range. This one has priority on [min] value.
  final String minOnProperty;

  /// [maxOnProperty] is the name of targeted property that user uses to provide maximal number of your range. This one has priority on [max] value.
  final String maxOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid(
    FormBuilderBase formBuilder,
    FormGroupBase formGroup,
    num value,
    String formPath,
    String modelFormPath,
  ) async {
    try {
      num _min = this.getLinkedProperty<num>(
        formGroup,
        this.minOnProperty,
        this.min,
      );
      num _max = this.getLinkedProperty<num>(
        formGroup,
        this.maxOnProperty,
        this.max,
      );

      bool isValid = _validate(value, _min, _max);
      return isValid;
    } on RemotePropertyException catch (e) {
      throw e;
    } catch (e) {
      throw new ValidationException(
          'An error occured with validator on form element with validator of type');
    }
  }

  bool _validate(num value, num minValue, num maxValue) {
    if (value == null) return true;
    if (minValue == null || maxValue == null) return false;
    return (value >= minValue && value <= maxValue);
  }
}
