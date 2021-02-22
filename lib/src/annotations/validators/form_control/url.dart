import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

enum EUrlProtocol { http, https, ftp }

class Url extends FormControlValidatorAnnotation<String> {
  const Url({
    @required this.allowEmptyProtocol,
    @required this.allowLocal,
    @required this.protocols,
    @required String error,
  }) : super(error: error);

  final bool allowEmptyProtocol;

  final bool allowLocal;

  final List<EUrlProtocol> protocols;

  @override
  Future<bool> isValid(FormControl<String> control) async {
    this._validateParameters();
    bool isValid = await this._validate(control.value);
    return isValid;
  }

  void _validateParameters() {
    if (this.allowEmptyProtocol == null)
      throw new ValidatorParameterException(
          'allowEmptyProtocol is not defined.');

    if (this.allowLocal == null)
      throw new ValidatorParameterException('allowLocal is not defined.');

    if (this.protocols == null)
      throw new ValidatorParameterException('protocols is not defined.');
  }

  bool _validate(String value) {
    if (value == null) return true;
    RegExp regExp = new RegExp(Rules.url(
      this.allowEmptyProtocol,
      this.allowLocal,
      this.protocols,
    ));
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
