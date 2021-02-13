import 'package:flutter_model_form_validation/src/exceptions/index.dart';

class ValidationException implements IException {
  ValidationException(this.message);

  @override
  String message;
}