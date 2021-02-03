import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class FormControl<TProperty> extends AbstractControl {
  FormControl({
    @required TProperty value,
    List<FormValidatorAnnotation> validators,
  })  : assert(FormControlFilter.isAllowedFormControlType<TProperty>(),
            'Cannot instanciate a FormControlElement with a not allowed type. Allowed types are : DateTime, num, int, double, Uint8, Uint16, Uint32, Uint64, Int8, Int16, Int32, Int64, String, bool, enums, List<DateTime>, List<num>, List<int>, List<double>, Uint8List, Uint16List, Uint32List, Uint64List, Int8List, Int16List, Int32List, Int64List, List<String>, List<bool> and a list of enum.'),
        super(validators) {
    this._value = value;
  }

  TProperty _value;

  TProperty get value => this._value;

  Future<void> setValue(TProperty value) async {
    this._value = value;
    await super.validateControl(value, this.formPath, this.modelPath);
  }

  void initialize(
    String name,
    FormGroup parentGroup,
  ) {
    assert(name != null && !name.isEmpty,
        'Cannot initialize form control if its name is not provided.');
    assert(parentGroup != null,
        'Cannot initialize form control if its parent form group is not provided.');

    super.name = name;
    super.parentGroup = parentGroup;
    super.isInitialized = true;
  }

  String get formPath {
    String part =
        (this.parentGroup != null) ? '${this.parentGroup.formPath}' : null;
    part += '.controls[\'${this.name}\']';
    return part;
  }

  String get modelPath {
    String part =
        (this.parentGroup != null) ? '${this.parentGroup.modelPath}' : null;
    part += '.${this.name}';
    return part;
  }

  Future<void> validate() async =>
      await super.validateControl(this.value, this.formPath, this.modelPath);
}
