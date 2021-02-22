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
    this._validateParameters();
    bool isValid = this._validate(control.value);
    return isValid;
  }

  void _validateParameters() {
    if (min == null)
      throw new ValidatorParameterException('min value is not defined.');

    if (max == null)
      throw new ValidatorParameterException('max value is not defined.');

    if (min.compareTo(max) > 0)
      throw new ValidatorParameterException(
          'min value is greater than max value.');
  }

  bool _validate(String value) {
    if (value == null) return true;
    return (value.length >= this.min && value.length <= this.max);
  }
}
