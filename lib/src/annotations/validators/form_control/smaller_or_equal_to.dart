import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class SmallerOrEqualTo<TProperty extends Comparable>
    extends FormControlValidatorAnnotation<TProperty> {
  const SmallerOrEqualTo({
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
    if (valueToCompare == null) return true;
    int comparison = value.compareTo(valueToCompare);
    bool isValid = (comparison <= 0);
    return isValid;
  }
}

class SmallerOrEqualToDateTime extends SmallerOrEqualTo<DateTime> {
  const SmallerOrEqualToDateTime({
    DateTime valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

class SmallerOrEqualToNumber extends SmallerOrEqualTo<num> {
  const SmallerOrEqualToNumber({
    num valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

class SmallerOrEqualToBigInt extends SmallerOrEqualTo<BigInt> {
  const SmallerOrEqualToBigInt({
    BigInt valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

class SmallerOrEqualToDouble extends SmallerOrEqualTo<double> {
  const SmallerOrEqualToDouble({
    double valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

class SmallerOrEqualToInt extends SmallerOrEqualTo<int> {
  const SmallerOrEqualToInt({
    int valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}

class SmallerOrEqualToString extends SmallerOrEqualTo<String> {
  const SmallerOrEqualToString({
    String valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          valueToCompareOnProperty: valueToCompareOnProperty,
          error: error,
        );
}
