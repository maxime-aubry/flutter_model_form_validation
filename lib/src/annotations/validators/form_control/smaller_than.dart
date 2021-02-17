import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/form_control/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class SmallerThan<TProperty extends Comparable>
    extends FormControlValidatorAnnotation<TProperty> {
  const SmallerThan({
    this.valueToCompare,
    this.remoteValueToCompare,
    @required String error,
  }) : super(error: error);

  /// [valueToCompare] is default value to compare.
  final TProperty valueToCompare;

  /// [remoteValueToCompare] is the name of targeted property that user uses to provide value to compare. This one has priority on [valueToCompare].
  final String remoteValueToCompare;

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
    bool isValid = (comparison < 0);
    return isValid;
  }
}

class SmallerThanDateTime extends SmallerThan<DateTime> {
  const SmallerThanDateTime({
    DateTime valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: valueToCompareOnProperty,
          error: error,
        );
}

class SmallerThanNumber extends SmallerThan<num> {
  const SmallerThanNumber({
    num valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: valueToCompareOnProperty,
          error: error,
        );
}

class SmallerThanBigInt extends SmallerThan<BigInt> {
  const SmallerThanBigInt({
    BigInt valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: valueToCompareOnProperty,
          error: error,
        );
}

class SmallerThanDouble extends SmallerThan<double> {
  const SmallerThanDouble({
    double valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: valueToCompareOnProperty,
          error: error,
        );
}

class SmallerThanInt extends SmallerThan<int> {
  const SmallerThanInt({
    int valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: valueToCompareOnProperty,
          error: error,
        );
}

class SmallerThanString extends SmallerThan<String> {
  const SmallerThanString({
    String valueToCompare,
    String valueToCompareOnProperty,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: valueToCompareOnProperty,
          error: error,
        );
}
