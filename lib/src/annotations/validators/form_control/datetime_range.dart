import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

/// [DateTimeRange] validator permits you to check that a datetime using by declared settings.
/// {@category Metadata}
/// {@subCategory Validators}
class DateTimeRange extends FormValidatorAnnotation<DateTime> {
  const DateTimeRange({
    this.min,
    this.max,
    this.minOnProperty,
    this.maxOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [min] is the minimal datetime of your range.
  final String min;

  /// [max] is the maximal datetime of your range.
  final String max;

  /// [minOnProperty] is the name of targeted property that user uses to provide minimal datetime of your range. This one has priority on [min] value.
  final String minOnProperty;

  /// [maxOnProperty] is the name of targeted property that user uses to provide maximal datetime of your range. This one has priority on [max] value.
  final String maxOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid(
    FormBuilderBase formBuilder,
    FormGroupBase formGroup,
    DateTime value,
    String formPath,
    String modelFormPath,
  ) async {
    try {
      DateTime _min = this.getLinkedProperty<DateTime>(
        formGroup,
        this.minOnProperty,
        this.min,
      );
      DateTime _max = this.getLinkedProperty<DateTime>(
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

  bool _validate(DateTime value, DateTime minValue, DateTime maxValue) {
    if (value == null) return true;
    if (minValue == null || maxValue == null) return false;
    return ((value.isAfter(minValue) || (value.compareTo(minValue) == 0)) &&
        (value.isBefore(maxValue) || (value.compareTo(maxValue) == 0)));
  }
}
