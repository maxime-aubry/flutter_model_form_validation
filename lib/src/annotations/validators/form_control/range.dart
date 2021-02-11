import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class Range<TProperty extends Comparable>
    extends FormControlValidatorAnnotation<TProperty> {
  const Range({
    this.min,
    this.max,
    this.minOnProperty,
    this.maxOnProperty,
    @required String error,
  }) : super(error: error);

  /// [min] is the minimal value of your range.
  final TProperty min;

  /// [max] is the maximal value of your range.
  final TProperty max;

  /// [minOnProperty] is the name of targeted property that user uses to provide minimal value of your range. This one has priority on [min] value.
  final String minOnProperty;

  /// [maxOnProperty] is the name of targeted property that user uses to provide maximal value of your range. This one has priority on [max] value.
  final String maxOnProperty;

  @override
  Future<bool> isValid(FormControl<TProperty> control) async {
    TProperty min = super.getValidatorParameter(
      control,
      this.minOnProperty,
      this.min,
    );
    TProperty max = super.getValidatorParameter(
      control,
      this.maxOnProperty,
      this.max,
    );
    if (min.compareTo(max) > 0)
      throw new ValidationException(
          'Range validator does not accept that min value is greater than max value.');
    bool isValid = this._validate(control.value, min, max);
    return isValid;
  }

  bool _validate(
    TProperty value,
    TProperty minValue,
    TProperty maxValue,
  ) {
    if (value == null) return true;
    if (minValue == null || maxValue == null) return false;
    int comparison_of_min = value.compareTo(minValue);
    int comparison_of_max = value.compareTo(maxValue);
    bool isValid = (comparison_of_min >= 0 && comparison_of_max <= 0);
    return isValid;
  }
}

class RangeOfDateTime extends Range<DateTime> {
  const RangeOfDateTime({
    DateTime min,
    DateTime max,
    String minOnProperty,
    String maxOnProperty,
    @required String error,
  }) : super(
          min: min,
          max: max,
          minOnProperty: minOnProperty,
          maxOnProperty: maxOnProperty,
          error: error,
        );
}

class RangeOfNumber extends Range<num> {
  const RangeOfNumber({
    num min,
    num max,
    String minOnProperty,
    String maxOnProperty,
    @required String error,
  }) : super(
          min: min,
          max: max,
          minOnProperty: minOnProperty,
          maxOnProperty: maxOnProperty,
          error: error,
        );
}

class RangeOfBigInt extends Range<BigInt> {
  const RangeOfBigInt({
    BigInt min,
    BigInt max,
    String minOnProperty,
    String maxOnProperty,
    @required String error,
  }) : super(
          min: min,
          max: max,
          minOnProperty: minOnProperty,
          maxOnProperty: maxOnProperty,
          error: error,
        );
}

class RangeOfDouble extends Range<double> {
  const RangeOfDouble({
    double min,
    double max,
    String minOnProperty,
    String maxOnProperty,
    @required String error,
  }) : super(
          min: min,
          max: max,
          minOnProperty: minOnProperty,
          maxOnProperty: maxOnProperty,
          error: error,
        );
}

class RangeOfInt extends Range<int> {
  const RangeOfInt({
    int min,
    int max,
    String minOnProperty,
    String maxOnProperty,
    @required String error,
  }) : super(
          min: min,
          max: max,
          minOnProperty: minOnProperty,
          maxOnProperty: maxOnProperty,
          error: error,
        );
}

class RangeOfString extends Range<String> {
  const RangeOfString({
    String min,
    String max,
    String minOnProperty,
    String maxOnProperty,
    @required String error,
  }) : super(
          min: min,
          max: max,
          minOnProperty: minOnProperty,
          maxOnProperty: maxOnProperty,
          error: error,
        );
}
