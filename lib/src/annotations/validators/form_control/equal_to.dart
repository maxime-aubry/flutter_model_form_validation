import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/form_control/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

/// [EqualTo] with [TProperty] generic type is a validator that check if a value is equal to another.
class EqualTo<TProperty extends Comparable>
    extends FormControlValidatorAnnotation<TProperty> {
  const EqualTo({
    this.valueToCompare,
    this.valueToCompareOnProperty,
    @required String error,
  }) : super(error: error);

  /// [valueToCompare] is default value to compare. It's a constant, provided by developer inside the [EqualTo] annotation.
  final TProperty valueToCompare;

  /// [valueToCompareOnProperty] is a name of [FormControl] that provides an overriding value of [valueToCompare].
  final String valueToCompareOnProperty;

  /// Compares [FormControl] value with another value.
  ///
  /// Returns a Future<bool>. If no data is provided using by [valueToCompare] or [valueToCompareOnProperty], validator will return [False].
  /// Else, the validator will check if FormControl's data is equal to [valueToCompare]. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] type here, with [TProperty] generic type.
  @override
  Future<bool> isValid(FormControl<TProperty> control) async {
    TProperty valueToCompare = super.getValidatorParameter(
      control,
      this.valueToCompareOnProperty,
      this.valueToCompare,
    );
    bool isValid = this._validate(control.value, valueToCompare);
    return isValid;
  }

  bool _validate(TProperty value, TProperty valueToCompare) {
    if (value == null) return true;
    if (value is String && value.isEmpty) return true;
    if (valueToCompare == null) return false;
    if (valueToCompare is String && valueToCompare.isEmpty) return false;
    int comparison = value.compareTo(valueToCompare);
    bool isValid = (comparison == 0);
    return isValid;
  }
}

/// [EqualToDateTime] is a validator that check if a [DateTime] value is equal to another.
class EqualToDateTime extends EqualTo<DateTime> {
  const EqualToDateTime({
    DateTime valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

/// [EqualToNumber] is a validator that check if a [num] value is equal to another.
class EqualToNumber extends EqualTo<num> {
  const EqualToNumber({
    num valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

/// [EqualToDouble] is a validator that check if a [double] value is equal to another.
class EqualToDouble extends EqualTo<double> {
  const EqualToDouble({
    double valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

/// [EqualToInt] is a validator that check if a [int] value is equal to another.
class EqualToInt extends EqualTo<int> {
  const EqualToInt({
    int valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

/// [EqualToString] is a validator that check if a [String] value is equal to another.
class EqualToString extends EqualTo<String> {
  const EqualToString({
    String valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}
