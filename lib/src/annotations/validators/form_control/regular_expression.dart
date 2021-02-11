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
  Future<bool> isValid(FormControl<String> control) async =>
      this._validate(control.value);

  bool _validate(String value) {
    RegExp regExp = new RegExp(this.expression);
    if (regExp.hasMatch(value.toString())) return true;
    return false;
  }
}
