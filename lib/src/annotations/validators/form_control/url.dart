import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class Url extends FormControlValidatorAnnotation<String> {
  const Url({
    @required String error,
  }) : super(error: error);

  @override
  Future<bool> isValid(FormControl<String> control) async =>
      this._validate(control.value);

  bool _validate(String value) {
    String _value = (value == null) ? '' : value;
    RegExp regExp = new RegExp(Rules.url);
    if (regExp.hasMatch(_value)) return true;
    return false;
  }
}
