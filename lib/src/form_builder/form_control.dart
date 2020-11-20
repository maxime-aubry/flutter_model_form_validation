import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class FormControl<TField> extends AbstractControl {
  FormControl({
    Object value,
    @required List<FormValidatorAnnotation> validators,
  }) : super(validators) {
    this.value = value;
  }

  @protected
  TField value;

  TField getValue() => this.value;

  void initialize(
    String name,
    FormGroup parentGroup,
  ) {
    assert(name != null && !name.isEmpty,
        'Cannot initialize form control if its name is not provided.');
    assert(parentGroup != null,
        'Cannot initialize form control if its parent form group is not provided.');
    assert(!super.isInitialized,
        'Cannot initialize form control if this one is already initialized.');

    super.controlName = name;
    super.parentGroup = parentGroup;

    FormBuilder formBuilder = this.getFormBuilder();
    formBuilder.formState.update(
      super.fullname,
      null,
      super.validation_status,
    );

    super.isInitialized = true;
  }

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

  Future validate() async =>
      await super.validateControl(this.value, this.formPath, this.modelPath);
}
