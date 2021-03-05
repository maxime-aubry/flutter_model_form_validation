import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

enum EUrlProtocol { http, https, ftp }

class Url extends FormControlValidatorAnnotation<String> {
  /* Public properties */
  final List<EUrlProtocol> protocols;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const Url({
    @required this.protocols,
    @required String error,
  }) : super(error: error);

  /* Public methods */
  @override
  Future<bool> isValid(FormControl<String> control) async {
    this._validateParameters();
    bool isValid = await this._validate(control.value);
    return isValid;
  }

  /* Protected methods */

  /* Private methods */
  void _validateParameters() {
    if (this.protocols == null || this.protocols.isEmpty)
      throw new ValidatorParameterException('protocols is not defined.');
  }

  bool _validate(String value) {
    if (value == null) return true;
    RegExp regExp = new RegExp(Rules.url(this.protocols));
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
