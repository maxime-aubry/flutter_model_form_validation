import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/form_control/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

/// [GreaterOrEqualTo] with [TProperty] generic type is a validator that check if a value is greater or equal to another.
class GreaterOrEqualTo<TProperty extends Comparable>
    extends FormControlValidatorAnnotation<TProperty> {
  const GreaterOrEqualTo({
    this.valueToCompare,
    this.remoteValueToCompare,
    @required String error,
  }) : super(error: error);

  /// [valueToCompare] is default value to compare. It's a constant, provided by developer inside the [GreaterOrEqualTo] annotation.
  final TProperty valueToCompare;

  /// [remoteValueToCompare] is a name of [FormControl] that provides an overriding value of [valueToCompare].
  final String remoteValueToCompare;

  /// Compares [FormControl] value with another value.
  ///
  /// Returns a Future<bool>. If no data is provided using by [valueToCompare] or [remoteValueToCompare], validator will return [False].
  /// Else, the validator will check if FormControl's data is greater or equal to [valueToCompare]. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] type here, with [TProperty] generic type.
  @override
  Future<bool> isValid(FormControl<TProperty> control) async {
    TProperty valueToCompare = super.getRemoteValidatorParameter<TProperty>(
      defaultValue: this.valueToCompare,
      localParameterName: 'valueToCompare',
      remoteParameterName: this.remoteValueToCompare,
      control: control.parentGroup,
    );
    bool isValid = this._validate(control.value, valueToCompare);
    return isValid;
  }

  bool _validate(TProperty value, TProperty valueToCompare) {
    if (value == null && valueToCompare == null) return true;
    if (value == null) return false;
    if (valueToCompare == null) return false;
    int comparison = value.compareTo(valueToCompare);
    bool isValid = (comparison >= 0);
    return isValid;
  }
}

/// [GreaterOrEqualToDateTime] is a validator that check if a [DateTime] value is greater or equal to another.
class GreaterOrEqualToDateTime extends GreaterOrEqualTo<DateTime> {
  const GreaterOrEqualToDateTime({
    DateTime valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: valueToCompareOnProperty,
          error: error,
        );
}

/// [GreaterOrEqualToNumber] is a validator that check if a [DateTime] value is greater or equal to another.
class GreaterOrEqualToNumber extends GreaterOrEqualTo<num> {
  const GreaterOrEqualToNumber({
    num valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: valueToCompareOnProperty,
          error: error,
        );
}

/// [GreaterOrEqualToBigInt] is a validator that check if a [DateTime] value is greater or equal to another.
class GreaterOrEqualToBigInt extends GreaterOrEqualTo<BigInt> {
  const GreaterOrEqualToBigInt({
    BigInt valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: valueToCompareOnProperty,
          error: error,
        );
}

/// [GreaterOrEqualToDouble] is a validator that check if a [DateTime] value is greater or equal to another.
class GreaterOrEqualToDouble extends GreaterOrEqualTo<double> {
  const GreaterOrEqualToDouble({
    double valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: valueToCompareOnProperty,
          error: error,
        );
}

/// [GreaterOrEqualToInt] is a validator that check if a [DateTime] value is greater or equal to another.
class GreaterOrEqualToInt extends GreaterOrEqualTo<int> {
  const GreaterOrEqualToInt({
    int valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: valueToCompareOnProperty,
          error: error,
        );
}

/// [GreaterOrEqualToString] is a validator that check if a [DateTime] value is greater or equal to another.
class GreaterOrEqualToString extends GreaterOrEqualTo<String> {
  const GreaterOrEqualToString({
    String valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: valueToCompareOnProperty,
          error: error,
        );
}
