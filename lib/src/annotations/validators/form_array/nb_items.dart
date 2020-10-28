import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_builder.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_group.dart';
import 'package:property_change_notifier/src/property_change_notifier.dart';

/// [NbItems] validator permits you to check quantity of items into an array.
/// {@category Metadata}
/// {@subCategory Validators}
class NbItems extends FormValidator<List> {
  const NbItems({
    this.min,
    this.max,
    this.minOnProperty,
    this.maxOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [min] is minimal quantity of items.
  final int min;

  /// [max] is maximal quantity of items.
  final int max;

  /// [minOnProperty] is the name of targeted property that user uses to provide minimal quantity of items of your array. This one has priority on [min] value.
  final String minOnProperty;

  /// [maxOnProperty] is the name of targeted property that user uses to provide maximal quantity of items of your array. This one has priority on [max] value.
  final String maxOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid<TModel extends PropertyChangeNotifier<String>>(
    FormBuilder<TModel> formBuilder,
    FormGroup<PropertyChangeNotifier<String>, PropertyChangeNotifier<String>>
        formGroup,
    List value,
  ) async {
    try {
      int _min = this.getLinkedProperty<TModel, int>(
        formBuilder.group.modelState.model,
        this.min,
        this.minOnProperty,
      );
      int _max = this.getLinkedProperty<TModel, int>(
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

  bool _validate(List value, int minValue, int maxValue) {
    if (value == null) return true;
    return value.length >= minValue && value.length <= maxValue;
  }
}
