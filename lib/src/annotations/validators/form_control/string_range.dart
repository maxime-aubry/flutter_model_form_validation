import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:property_change_notifier/src/property_change_notifier.dart';

/// [StringRange] validator permits you to check that a string using by declared settings.
/// {@category Metadata}
/// {@subCategory Validators}
class StringRange extends FormValidator<String> {
  const StringRange({
    this.min,
    this.max,
    this.minOnProperty,
    this.maxOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [min] is the minimal string of your range.
  final String min;

  /// [max] is the maximal string of your range.
  final String max;

  /// [minOnProperty] is the name of targeted property that user uses to provide minimal string of your range. This one has priority on [min] value.
  final String minOnProperty;

  /// [maxOnProperty] is the name of targeted property that user uses to provide maximal string of your range. This one has priority on [max] value.
  final String maxOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid<TModel extends PropertyChangeNotifier<String>>(
    FormBuilder<TModel> formBuilder,
    FormGroup<PropertyChangeNotifier<String>, PropertyChangeNotifier<String>>
        formGroup,
    String value,
  ) async {
    try {
      String _min = this.getLinkedProperty<TModel, String>(
        formBuilder.group.modelState.model,
        this.min,
        this.minOnProperty,
      );
      String _max = this.getLinkedProperty<TModel, String>(
        formBuilder.group.modelState.model,
        this.max,
        this.maxOnProperty,
      );

      bool isValid = _validate(value, _min, _max);
      return isValid;
    } catch (e) {
      throw new ValidationException(
          'An error occurend with validator on from control with validator of type');
    }
  }

  bool _validate(String value, String minValue, String maxValue) {
    if (value == null) return true;
    if (minValue == null || maxValue == null) return false;
    return ((value.compareTo(minValue) == 0 ||
            value.compareTo(minValue) == 1) &&
        (value.compareTo(maxValue) == 0 || value.compareTo(maxValue) == -1));
  }
}
