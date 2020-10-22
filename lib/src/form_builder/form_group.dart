import 'package:flutter_model_form_validation/src/form_builder/abstract_control.dart';
import 'package:reflectable/reflectable.dart';

class FormGroup extends AbstractControl {
  FormGroup([MethodMirror declaration]) : super(declaration) {
    this.controls = {};
  }

  // public properties
  Map<String, AbstractControl> controls;
}
