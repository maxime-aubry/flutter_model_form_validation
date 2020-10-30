import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormGroup extends AbstractControl {
  FormGroup(
    String name,
    FormGroup parentGroup,
  ) : super(name, parentGroup) {
    this.controls = {};
  }

  // public properties
  Map<String, AbstractControl> controls;
}
