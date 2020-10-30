import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormControlBase extends AbstractControl {
  FormControlBase(
    Object value,
    String name,
    FormGroupBase parentGroup,
  )   : assert(name != null),
        // assert(parentGroup != null),
        super(name, parentGroup) {
    this.value = value;
  }

  // public properties
  Object value;
}
