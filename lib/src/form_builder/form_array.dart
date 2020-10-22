import 'package:flutter_model_form_validation/src/form_builder/abstract_control.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_group.dart';
import 'package:reflectable/reflectable.dart';

class FormArray extends AbstractControl {
  FormArray(MethodMirror declaration) : super(declaration) {
    this.groups = new List<FormGroup>();
  }

  List<FormGroup> groups;

  void addItem(FormGroup item) {
    if (this.groups == null) this.groups = new List<FormGroup>();
    this.groups.add(item);
  }
}
