import 'package:flutter_model_form_validation/src/exceptions/index.dart';

class MultipleStepFormStateIndexerException implements IException {
  MultipleStepFormStateIndexerException(this.message);

  @override
  String message;
}
