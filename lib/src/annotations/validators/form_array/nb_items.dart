import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

/// [NbItems] validator permits you to check quantity of items into an array.
/// {@category Metadata}
/// {@subCategory Validators}
class NbItems extends FormValidatorAnnotation<List> {
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
  Future<bool> isValid(
    FormBuilderBase formBuilder,
    FormGroupBase formGroup,
    List value,
  ) async {
    try {
      int _min = this.getLinkedProperty<int>(
        formGroup,
        this.minOnProperty,
        this.min,
      );
      int _max = this.getLinkedProperty<int>(
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

  bool _validate(List value, int minValue, int maxValue) {
    if (value == null) return true;
    return value.length >= minValue && value.length <= maxValue;
  }
}
