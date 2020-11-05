import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:reflectable/reflectable.dart';

class ModelFormControl<TModel extends ModelForm> extends FormControlBase
    with ModelFormValidator {
  ModelFormControl(
    ModelFormState<TModel> formState,
    Object value,
    String name,
    FormGroupBase parentGroup,
  ) : super(value, name, parentGroup) {
    this._initializeFormControl(formState);
  }

  String get name => this.controlName;

  void _initializeFormControl(ModelFormState<TModel> formState) {
    assert(formState != null, '');

    this.initialize(
        this.controlName, this.parentGroup as ModelFormGroup, formState,
        () async {
      await this._setValue(this.parentGroup as ModelFormGroup);
    });
  }

  /// [_setValue] method set this form control with the new value from form.
  /// Next, this value is validated, and the model state too.
  Future _setValue(ModelFormGroup parentGroup) async {
    InstanceMirror instanceMirror = super.getInstanceMirror(
      parentGroup.current,
    );
    this.value = super.getSubObject(instanceMirror, this.controlName);

    await this.validate();
  }

  Future validate() async => await super.validate$1(
        this.parentGroup as ModelFormGroup,
        this.controlName,
        this.value,
        this.formPath,
        this.modelPath,
      );
}
