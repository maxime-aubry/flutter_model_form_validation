import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/form_control/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class GreaterThan<TProperty extends Comparable>
    extends FormControlValidatorAnnotation<TProperty> {
  /* Public properties */
  /// [valueToCompare] is default value to compare.
  final TProperty valueToCompare;

  /// [remoteValueToCompare] is the name of targeted property that user uses to provide value to compare. This one has priority on [valueToCompare].
  final String remoteValueToCompare;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const GreaterThan({
    this.valueToCompare,
    this.remoteValueToCompare,
    @required String error,
  }) : super(error: error);

  /* Public methods */
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
    bool isValid = (comparison > 0);
    return isValid;
  }
}

class GreaterThanDateTime extends GreaterThan<DateTime> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const GreaterThanDateTime({
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

class GreaterThanDouble extends GreaterThan<double> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const GreaterThanDouble({
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

class GreaterThanInt extends GreaterThan<int> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const GreaterThanInt({
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

class GreaterThanNumber extends GreaterThan<num> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */

  /* Public methods */

  /* Protected methods */

  /* Private methods */
  const GreaterThanNumber({
    num valueToCompare,
    String remoteValueToCompare,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: remoteValueToCompare,
          error: error,
        );
}

class GreaterThanString extends GreaterThan<String> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const GreaterThanString({
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
