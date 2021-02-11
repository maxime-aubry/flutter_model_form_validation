import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/form_control/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class Email extends FormControlValidatorAnnotation<String> {
  const Email({
    @required String error,
  }) : super(error: error);

  @override
  Future<bool> isValid(FormControl<String> control) async =>
      this._validate(control.value);

  bool _validate(String value) {
    if (value == null) return true;
    RegExp regExp = new RegExp(Rules.email);
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
