import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';

class AbstractControlState {
  AbstractControlState(this.name, this.error, this.status);

  String name;
  ValidationError error;
  EAbstractControlStatus status;
}
