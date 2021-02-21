import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class RegularExpression extends FormControlValidatorAnnotation<String> {
  const RegularExpression({
    @required this.expression,
    @required String error,
  }) : super(error: error);

  /// [expression] is the regular expression to use.
  final String expression;

  @override
  Future<bool> isValid(FormControl<String> control) async {
    this._validateParameters();
    bool isValid = await this._validate(control.value);
    return isValid;
  }

  void _validateParameters() {
    if (this.expression == null || this.expression.isEmpty)
      throw new ValidatorParameterException(
          'Regular expression is not defined.');
  }

  bool _validate(String value) {
    if (value == null) return true;
    RegExp regExp = new RegExp(this.expression);
    if (regExp.hasMatch(value.toString())) return true;
    return false;
  }
}
