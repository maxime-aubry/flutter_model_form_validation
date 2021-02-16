import 'package:flutter_model_form_validation/src/exceptions/index.dart';

class ValidatorParameterException implements IException {
  ValidatorParameterException(this.message);

  @override
  String message;
}
