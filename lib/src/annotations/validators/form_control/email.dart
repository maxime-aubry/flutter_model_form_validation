import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/form_control/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

/// [Email] is a validator that check if a value is a valid email.
class Email extends FormControlValidatorAnnotation<String> {
  const Email({
    @required String error,
  }) : super(error: error);

  /// Compares [FormControl] value with another value.
  ///
  /// Returns a Future<bool>. The validator will check if FormControl's data is a valid email. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] of [String] type here.
  @override
  Future<bool> isValid(FormControl<String> control) async =>
      this._validate(control.value);

  bool _validate(String value) {
    if (value == null || value.isEmpty) return true;

    String _value = (value == null) ? '' : value;
    RegExp regExp = new RegExp(Rules.email);
    if (regExp.hasMatch(_value)) return true;
    return false;
  }
}
