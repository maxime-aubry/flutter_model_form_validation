import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class NotEqualTo<TProperty extends Comparable>
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
  const NotEqualTo({
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
    bool isValid = (comparison != 0);
    return isValid;
  }
}

class NotEqualToDateTime extends NotEqualTo<DateTime> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const NotEqualToDateTime({
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

class NotEqualToDouble extends NotEqualTo<double> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const NotEqualToDouble({
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

class NotEqualToInt extends NotEqualTo<int> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const NotEqualToInt({
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

class NotEqualToNumber extends NotEqualTo<num> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const NotEqualToNumber({
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

class NotEqualToString extends NotEqualTo<String> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const NotEqualToString({
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
