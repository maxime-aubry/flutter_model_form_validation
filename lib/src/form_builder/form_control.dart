import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormControl extends AbstractControl {
  FormControl(
    Object value,
    String name,
    FormGroup parentGroup,
  )   : assert(name != null),
        assert(parentGroup != null),
        super(name, parentGroup) {
    this.value = value;
  }

  // public properties
  Object value;
}
