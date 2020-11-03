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
  )   : assert(formState != null),
        super(value, name, parentGroup) {
    this.formState = formState;
    this.status = EAbstractControlStatus.pure;
    this._initialize(value);
  }

  // getters
  String get listenerName => super.listenerName;
  EAbstractControlStatus get status => super.status;
  Object get value => super.value;

  // private methods
  void _initialize(Object value) {
    if (this.parentGroup != null && this.parentGroup is ModelFormGroup)
      super.initialize(parentGroup as ModelFormGroup, name, () async {
        await this._setValue(this.parentGroup as ModelFormGroup);
      });
  }

  /// [_setValue] method set this form control with the new value from form.
  /// Next, this value is validated, and the model state too.
  Future _setValue(ModelFormGroup parentGroup) async {
    assert(parentGroup != null);

    InstanceMirror instanceMirror = super.getInstanceMirror(
      parentGroup.current,
    );
    this.value = super.getSubObject(
      instanceMirror,
      this.name,
    );

    await super.validate(
      this.formState,
      parentGroup,
      this.name,
      this.value,
      this.formPath,
      this.modelPath,
    );
  }
}
