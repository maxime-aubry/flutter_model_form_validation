import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

/// [NotEqualToNumber] validator permits you to check that a value is not equal to the value of another property.
/// {@category Metadata}
/// {@subCategory Validators}
class NotEqualToNumber extends FormValidatorAnnotation<num> {
  const NotEqualToNumber({
    this.valueToCompare,
    this.valueToCompareOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [valueToCompare] is default value to compare.
  final num valueToCompare;

  /// [valueToCompareOnProperty] is the name of targeted property that user uses to provide datetime to compare. This one has priority on [valueToCompare].
  final String valueToCompareOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid(
    FormBuilderBase formBuilder,
    FormGroupBase formGroup,
    num value,
  ) async {
    try {
      num _valueToCompare = this.getLinkedProperty<num>(
        formGroup,
        this.valueToCompareOnProperty,
        this.valueToCompare,
      );

      bool isValid = _validate(value, _valueToCompare);
      return isValid;
    } on RemotePropertyException catch (e) {
      throw e;
    } catch (e) {
      throw new ValidationException(
          'An error occured with validator on form element with validator of type');
    }
  }

  bool _validate(num value, num valueToCompare) {
    if (value == null) return true;
    if (valueToCompare == null) return false;
    return (value.compareTo(valueToCompare) != 0);
  }
}
