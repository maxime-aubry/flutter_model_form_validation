import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class AbstractControl {
  AbstractControl(this.controlName, this.parentGroup);

  @protected
  String controlName;
  FormGroupBase parentGroup;
}
