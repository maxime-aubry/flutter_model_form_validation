import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class AbstractControlState {
  AbstractControlState(this.name, this.error, this.status);

  String name;
  ValidationError error;
  EAbstractControlStatus status;
}
