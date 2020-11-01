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

  // getters
  String get formPath {
    return this.getFormPath(parts: new List<String>());
  }

  String get modelPath {
    return this.getModelPath(parts: new List<String>());
  }

  String getFormPath({
    List<String> parts,
  }) {
    parts.insert(0, 'controls[\'${this.name}\']');
    return this.parentGroup.getFormPath(parts: parts);
  }

  String getModelPath({
    List<String> parts,
  }) {
    parts.insert(0, this.name);
    return this.parentGroup.getModelPath(parts: parts);
  }
}
