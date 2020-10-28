import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:property_change_notifier/src/property_change_notifier.dart';

/// [SmallerThanNumber] validator permits you to check that a value is smaller than the value of another property.
/// {@category Metadata}
/// {@subCategory Validators}
class SmallerThanNumber extends FormValidator<num> {
  const SmallerThanNumber({
    this.valueToCompare,
    this.valueToCompareOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [valueToCompare] is default value to compare.
  final num valueToCompare;

  /// [valueToCompareOnProperty] is the name of targeted property that user uses to provide number to compare. This one has priority on [valueToCompare].
  final String valueToCompareOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  Future<bool> isValid<TModel extends PropertyChangeNotifier<String>>(
    FormBuilder<TModel> formBuilder,
    FormGroup<PropertyChangeNotifier<String>, PropertyChangeNotifier<String>>
        formGroup,
    num value,
  ) async {
    try {
      num _valueToCompare = this.getLinkedProperty<TModel, num>(
        formBuilder.group.modelState.model,
        this.valueToCompare,
        this.valueToCompareOnProperty,
      );

      bool isValid = _validate(value, _valueToCompare);
      return isValid;
    } catch (e) {
      throw new ValidationException(
          'An error occurend with validator on from control with validator of type');
    }
  }

  bool _validate(num value, num valueToCompare) {
    if (value == null) return true;
    if (valueToCompare == null) return false;
    return (value < valueToCompare);
  }
}
