import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class SmallerOrEqualTo<TProperty extends Comparable>
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
  const SmallerOrEqualTo({
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
    bool isValid = (comparison <= 0);
    return isValid;
  }
}

class SmallerOrEqualToDateTime extends SmallerOrEqualTo<DateTime> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const SmallerOrEqualToDateTime({
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

class SmallerOrEqualToDouble extends SmallerOrEqualTo<double> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const SmallerOrEqualToDouble({
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

class SmallerOrEqualToInt extends SmallerOrEqualTo<int> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const SmallerOrEqualToInt({
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

class SmallerOrEqualToNumber extends SmallerOrEqualTo<num> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const SmallerOrEqualToNumber({
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

class SmallerOrEqualToString extends SmallerOrEqualTo<String> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const SmallerOrEqualToString({
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
