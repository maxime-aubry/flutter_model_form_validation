import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/form_control/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class GreaterOrEqualTo<TProperty extends Comparable>
    extends FormControlValidatorAnnotation<TProperty> {
  const GreaterOrEqualTo({
    this.valueToCompare,
    this.valueToCompareOnProperty,
    @required String error,
  }) : super(error: error);

  /// [valueToCompare] is default value to compare.
  final TProperty valueToCompare;

  /// [valueToCompareOnProperty] is the name of targeted property that user uses to provide value to compare. This one has priority on [valueToCompare].
  final String valueToCompareOnProperty;

  @override
  Future<bool> isValid(FormControl<TProperty> control) async {
    TProperty valueToCompare = super.getValidatorParameter<TProperty>(
      control,
      this.valueToCompareOnProperty,
      this.valueToCompare,
    );
    bool isValid = this._validate(control.value, valueToCompare);
    return isValid;
  }

  bool _validate(TProperty value, TProperty valueToCompare) {
    if (value == null) return true;
    if (valueToCompare == null) return false;
    int comparison = value.compareTo(valueToCompare);
    bool isValid = (comparison >= 0);
    return isValid;
  }
}

class GreaterOrEqualToDateTime extends GreaterOrEqualTo<DateTime> {
  const GreaterOrEqualToDateTime({
    DateTime valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

class GreaterOrEqualToNumber extends GreaterOrEqualTo<num> {
  const GreaterOrEqualToNumber({
    num valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

class GreaterOrEqualToBigInt extends GreaterOrEqualTo<BigInt> {
  const GreaterOrEqualToBigInt({
    BigInt valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

class GreaterOrEqualToDouble extends GreaterOrEqualTo<double> {
  const GreaterOrEqualToDouble({
    double valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

class GreaterOrEqualToInt extends GreaterOrEqualTo<int> {
  const GreaterOrEqualToInt({
    int valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

class GreaterOrEqualToString extends GreaterOrEqualTo<String> {
  const GreaterOrEqualToString({
    String valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}
