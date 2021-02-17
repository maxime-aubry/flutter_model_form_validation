import 'package:flutter_model_form_validation/src/exceptions/index.dart';

class ValidatorNavigationException implements IException {
  ValidatorNavigationException(this.message);

  @override
  String message;
}
