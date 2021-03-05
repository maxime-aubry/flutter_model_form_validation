import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/form_control/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

/// [GreaterOrEqualTo] with [TProperty] generic type is a validator that check if a value is greater or equal to another.
class GreaterOrEqualTo<TProperty extends Comparable>
    extends FormControlValidatorAnnotation<TProperty> {
  /* Public properties */
  /// [valueToCompare] is default value to compare. It's a constant, provided by developer inside the [GreaterOrEqualTo] annotation.
  final TProperty valueToCompare;

  /// [remoteValueToCompare] is a name of [FormControl] that provides an overriding value of [valueToCompare].
  final String remoteValueToCompare;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const GreaterOrEqualTo({
    this.valueToCompare,
    this.remoteValueToCompare,
    @required String error,
  }) : super(error: error);

  /* Public methods */
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
      formGroup: control.parent,
    );
    bool isValid = this._validate(control.value, valueToCompare);
    return isValid;
  }

  /* Protected methods */

  /* Private methods */
  bool _validate(TProperty value, TProperty valueToCompare) {
    if (value == null || valueToCompare == null) return true;
    int comparison = value.compareTo(valueToCompare);
    bool isValid = (comparison >= 0);
    return isValid;
  }
}

/// [GreaterOrEqualToDateTime] is a validator that check if a [DateTime] value is greater or equal to another.
class GreaterOrEqualToDateTime extends GreaterOrEqualTo<DateTime> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const GreaterOrEqualToDateTime({
    DateTime valueToCompare,
    String remoteValueToCompare,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: remoteValueToCompare,
          error: error,
        );

  /* Public methods */

  /* Protected methods */

  /* Private methods */
}

/// [GreaterOrEqualToDouble] is a validator that check if a [DateTime] value is greater or equal to another.
class GreaterOrEqualToDouble extends GreaterOrEqualTo<double> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const GreaterOrEqualToDouble({
    double valueToCompare,
    String remoteValueToCompare,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: remoteValueToCompare,
          error: error,
        );

  /* Public methods */

  /* Protected methods */

  /* Private methods */
}

/// [GreaterOrEqualToInt] is a validator that check if a [DateTime] value is greater or equal to another.
class GreaterOrEqualToInt extends GreaterOrEqualTo<int> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const GreaterOrEqualToInt({
    int valueToCompare,
    String remoteValueToCompare,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: remoteValueToCompare,
          error: error,
        );

  /* Public methods */

  /* Protected methods */

  /* Private methods */
}

/// [GreaterOrEqualToNumber] is a validator that check if a [DateTime] value is greater or equal to another.
class GreaterOrEqualToNumber extends GreaterOrEqualTo<num> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const GreaterOrEqualToNumber({
    num valueToCompare,
    String remoteValueToCompare,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: remoteValueToCompare,
          error: error,
        );

/* Public methods */

/* Protected methods */

/* Private methods */
}

/// [GreaterOrEqualToString] is a validator that check if a [DateTime] value is greater or equal to another.
class GreaterOrEqualToString extends GreaterOrEqualTo<String> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const GreaterOrEqualToString({
    String valueToCompare,
    String remoteValueToCompare,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: remoteValueToCompare,
          error: error,
        );

  /* Public methods */

  /* Protected methods */

  /* Private methods */
}
