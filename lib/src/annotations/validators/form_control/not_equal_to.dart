import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class NotEqualTo<TProperty extends Comparable>
    extends FormControlValidatorAnnotation<TProperty> {
  const NotEqualTo({
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
    bool isValid = (comparison != 0);
    return isValid;
  }
}

class NotEqualToDateTime extends NotEqualTo<DateTime> {
  const NotEqualToDateTime({
    DateTime valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

class NotEqualToNumber extends NotEqualTo<num> {
  const NotEqualToNumber({
    num valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

class NotEqualToBigInt extends NotEqualTo<BigInt> {
  const NotEqualToBigInt({
    BigInt valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

class NotEqualToDouble extends NotEqualTo<double> {
  const NotEqualToDouble({
    double valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

class NotEqualToInt extends NotEqualTo<int> {
  const NotEqualToInt({
    int valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

class NotEqualToString extends NotEqualTo<String> {
  const NotEqualToString({
    String valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}
