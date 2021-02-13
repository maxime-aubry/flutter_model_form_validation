import 'package:flutter_model_form_validation/src/exceptions/index.dart';

class FormControlFilterException implements IException {
  FormControlFilterException(this.message);

  @override
  String message;
}
