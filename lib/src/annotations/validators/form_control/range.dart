import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class Range<TProperty extends Comparable>
    extends FormControlValidatorAnnotation<TProperty> {
  const Range({
    this.min,
    this.max,
    this.remoteMin,
    this.remoteMax,
    @required String error,
  }) : super(error: error);

  /// [min] is the minimal value of your range.
  final TProperty min;

  /// [max] is the maximal value of your range.
  final TProperty max;

  /// [remoteMin] is the name of targeted property that user uses to provide minimal value of your range. This one has priority on [min] value.
  final String remoteMin;

  /// [remoteMax] is the name of targeted property that user uses to provide maximal value of your range. This one has priority on [max] value.
  final String remoteMax;

  @override
  Future<bool> isValid(FormControl<TProperty> control) async {
    TProperty min = super.getRemoteValidatorParameter(
      defaultValue: this.min,
      localParameterName: 'min',
      remoteParameterName: this.remoteMin,
      control: control.parentGroup,
    );
    TProperty max = super.getRemoteValidatorParameter(
      defaultValue: this.max,
      localParameterName: 'max',
      remoteParameterName: this.remoteMax,
      control: control.parentGroup,
    );

    if (min == null)
      throw new ValidatorParameterException('Min is not defined.');
    if (max == null)
      throw new ValidatorParameterException('Max is not defined.');
    if (min.compareTo(max) > 0)
      throw new ValidationException('Min value is greater than max value.');

    bool isValid = this._validate(control.value, min, max);
    return isValid;
  }

  bool _validate(
    TProperty value,
    TProperty minValue,
    TProperty maxValue,
  ) {
    if (value == null && minValue == null && maxValue == null) return true;
    if (value == null) return false;
    if (minValue == null) return false;
    if (maxValue == null) return false;
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
    String remoteMin,
    String remoteMax,
    @required String error,
  }) : super(
          min: min,
          max: max,
          remoteMin: remoteMin,
          remoteMax: remoteMax,
          error: error,
        );
}

class RangeOfNumber extends Range<num> {
  const RangeOfNumber({
    num min,
    num max,
    String remoteMin,
    String remoteMax,
    @required String error,
  }) : super(
          min: min,
          max: max,
          remoteMin: remoteMin,
          remoteMax: remoteMax,
          error: error,
        );
}

class RangeOfDouble extends Range<double> {
  const RangeOfDouble({
    double min,
    double max,
    String remoteMin,
    String remoteMax,
    @required String error,
  }) : super(
          min: min,
          max: max,
          remoteMin: remoteMin,
          remoteMax: remoteMax,
          error: error,
        );
}

class RangeOfInt extends Range<int> {
  const RangeOfInt({
    int min,
    int max,
    String remoteMin,
    String remoteMax,
    @required String error,
  }) : super(
          min: min,
          max: max,
          remoteMin: remoteMin,
          remoteMax: remoteMax,
          error: error,
        );
}

class RangeOfString extends Range<String> {
  const RangeOfString({
    String min,
    String max,
    String remoteMin,
    String remoteMax,
    @required String error,
  }) : super(
          min: min,
          max: max,
          remoteMin: remoteMin,
          remoteMax: remoteMax,
          error: error,
        );
}
