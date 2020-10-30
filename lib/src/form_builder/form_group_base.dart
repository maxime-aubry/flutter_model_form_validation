import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormGroupBase extends AbstractControl {
  FormGroupBase(
    String name,
    FormGroupBase parentGroup,
    Map<String, AbstractControl> controls,
  ) : super(name, parentGroup) {
    this.controls = (controls == null) ? {} : controls;
  }

  // public properties
  Map<String, AbstractControl> controls;
}
