import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class StringLength extends FormControlValidatorAnnotation<String> {
  const StringLength({
    @required this.min,
    @required this.max,
    @required String error,
  }) : super(error: error);

  /// [min] is the minimal number of your string length.
  final int min;

  /// [max] is the maximal number of your string length.
  final int max;

  @override
  Future<bool> isValid(FormControl<String> control) async {
    if (min == null) throw new ValidationException('Min value is not defined.');
    if (max == null) throw new ValidationException('Max value is not defined.');
    if (min.compareTo(max) > 0)
      throw new ValidationException('Min value is greater than max value.');
    bool isValid = this._validate(control.value);
    return isValid;
  }

  bool _validate(String value) {
    if (value == null) return true;
    return (value.length >= this.min && value.length <= this.max);
  }
}
