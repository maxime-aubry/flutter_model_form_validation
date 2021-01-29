import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormControl<TField> extends AbstractControl {
  FormControl({
    @required TField value,
    List<FormValidatorAnnotation> validators,
  }) : super(validators) {
    this._value = value;
  }

  TField _value;

  TField get value => this._value;

  Future<void> setValue(TField value) async {
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
    // assert(!super.isInitialized,
    //     'Cannot initialize form control if this one is already initialized.');

    super.name = name;
    super.parentGroup = parentGroup;
    // super.isInitialized = true;
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

  Future validate() async =>
      await super.validateControl(this.value, this.formPath, this.modelPath);
}
