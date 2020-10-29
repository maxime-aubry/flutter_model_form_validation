import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';

/// [DateTimeRange] validator permits you to check that a datetime using by declared settings.
/// {@category Metadata}
/// {@subCategory Validators}
class DateTimeRange extends FormValidator<DateTime> {
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
  Future<bool> isValid<TModel extends ModelForm>(
    FormBuilder<TModel> formBuilder,
    FormGroup<ModelForm, ModelForm> formGroup,
    DateTime value,
  ) async {
    try {
      DateTime _min = this.getLinkedProperty<TModel, DateTime>(
        formBuilder.group.modelState.model,
        this.min.toDateTime(),
        this.minOnProperty,
      );
      DateTime _max = this.getLinkedProperty<TModel, DateTime>(
        formBuilder.group.modelState.model,
        this.max.toDateTime(),
        this.maxOnProperty,
      );

      bool isValid = _validate(value, _min, _max);
      return isValid;
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
