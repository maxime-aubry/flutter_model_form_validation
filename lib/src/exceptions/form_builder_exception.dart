import 'package:flutter_model_form_validation/src/exceptions/index.dart';

class FormBuilderException implements IException {
  FormBuilderException(this.message);

  @override
  String message;
}
