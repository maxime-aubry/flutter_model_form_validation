import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormControlBase extends AbstractControl {
  FormControlBase(
    Object value,
    String name,
    FormGroupBase parentGroup,
  )   : assert(name != null),
        super(name, parentGroup) {
    this.value = value;
  }

  @protected
  Object value;

  Object getValue() => this.value;

  String get formPath {
    String part =
        (this.parentGroup != null) ? '${this.parentGroup.formPath}' : null;
    part += '.controls[\'${this.controlName}\']';
    return part;
  }

  String get modelPath {
    String part =
        (this.parentGroup != null) ? '${this.parentGroup.modelPath}' : null;
    part += '.${this.controlName}';
    return part;
  }
}
