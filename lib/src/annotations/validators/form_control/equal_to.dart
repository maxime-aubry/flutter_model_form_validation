import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/form_control/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class EqualTo<TProperty extends Comparable>
    extends FormControlValidatorAnnotation<TProperty> {
  const EqualTo({
    this.valueToCompare,
    this.valueToCompareOnProperty,
    @required String error,
  }) : super(error: error);

  /// [valueToCompare] is default value to compare.
  final TProperty valueToCompare;

  /// [valueToCompareOnProperty] is the name of targeted property that user uses to provide value to compare. This one has priority on [valueToCompare].
  final String valueToCompareOnProperty;

  @override
  Future<bool> isValid(FormControl<TProperty> control, String property) async {
    TProperty remoteValue = control.parentGroup
            .getFormControl<TProperty>(this.valueToCompareOnProperty)
            .value ??
        this.valueToCompare;
    bool isValid = this._validate(control.value, remoteValue);
    return isValid;
  }

  bool _validate(TProperty value, TProperty valueToCompare) {
    if (value == null) return true;
    if (valueToCompare == null) return false;
    int comparison = value.compareTo(valueToCompare);
    bool isValid = (comparison == 0);
    return isValid;
  }
}

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

class EqualToBigInt extends EqualTo<BigInt> {
  const EqualToBigInt({
    BigInt valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

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
