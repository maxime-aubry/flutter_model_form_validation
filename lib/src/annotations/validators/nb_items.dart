import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

/// [NbItems] validator permits you to check quantity of items into an array.
/// {@category Metadata}
/// {@subCategory Validators}
class NbItems extends FormValidatorAnnotation {
  const NbItems({
    this.min,
    this.max,
    this.minOnProperty,
    this.maxOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [min] is minimal quantity of items.
  final String min;

  /// [max] is maximal quantity of items.
  final String max;

  /// [minOnProperty] is the name of targeted property that user uses to provide minimal quantity of items of your array. This one has priority on [min] value.
  final String minOnProperty;

  /// [maxOnProperty] is the name of targeted property that user uses to provide maximal quantity of items of your array. This one has priority on [max] value.
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

      if (value is! List) throw new Exception('field type must be a list');

      bool isValid = this._validate(
        value: value,
        minValue: this.getRemoteValue<num>(fg, this.minOnProperty, this.min),
        maxValue: this.getRemoteValue<num>(fg, this.maxOnProperty, this.max),
      );
      return isValid;
    } on RemotePropertyException catch (e) {
      throw e;
    } catch (e) {
      throw new ValidationException(
          'An error occured with validator on form element with validator of type');
    }
  }

  bool _validate({
    @required List value,
    @required num minValue,
    @required num maxValue,
  }) {
    if (value == null) return true;
    return value.length >= minValue && value.length <= maxValue;
  }
}
