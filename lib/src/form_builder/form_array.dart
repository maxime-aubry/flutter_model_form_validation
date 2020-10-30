import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormArray extends AbstractControl {
  FormArray(
    String name,
    FormGroup parentGroup,
  )   : assert(name != null),
        assert(parentGroup != null),
        super(name, parentGroup) {
    this.groups = new List<FormGroup>();
  }

  // public properties
  List<FormGroup> groups;
}
