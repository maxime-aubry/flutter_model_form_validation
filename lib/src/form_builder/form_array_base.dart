import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormArrayBase extends AbstractControl {
  FormArrayBase(
    String name,
    FormGroupBase parentGroup,
    List<FormGroupBase> groups,
  )   : assert(name != null),
        // assert(parentGroup != null),
        super(name, parentGroup) {
    this.groups = (groups == null) ? [] : groups;
  }

  // public properties
  List<FormGroupBase> groups;
}
