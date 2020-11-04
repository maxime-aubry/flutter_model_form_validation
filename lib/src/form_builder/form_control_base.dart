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

  // public properties
  Object value;

  // getters
  String get formPath {
    return this.getFormPath(parts: new List<String>());
  }

  String get modelPath {
    return this.getModelPath(parts: new List<String>());
  }

  // public methods
  String getFormPath({
    List<String> parts,
  }) {
    // add this part into list
    parts.insert(0, 'controls[\'${this.name}\']');
    // call getFormPath of parent
    return this.parentGroup.getFormPath(parts: parts);
  }

  String getModelPath({
    List<String> parts,
  }) {
    // add this part into list
    parts.insert(0, this.name);
    // call getModelPath of parent
    return this.parentGroup.getModelPath(parts: parts);
  }
}
