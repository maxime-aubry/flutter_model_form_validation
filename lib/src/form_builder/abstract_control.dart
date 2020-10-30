import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class AbstractControl {
  AbstractControl(this.name, this.parentGroup);

  // public properties
  String name;
  FormGroup parentGroup;
}
