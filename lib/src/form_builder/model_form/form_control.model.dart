import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:reflectable/reflectable.dart';

class ModelFormControl<TModel extends ModelForm> extends FormControlBase
    with ModelFormValidator {
  ModelFormControl(
    ModelFormState<TModel> modelState,
    Object value,
    String name,
    FormGroupBase parentGroup,
  )   : assert(modelState != null),
        super(value, name, parentGroup) {
    this.modelState = modelState;
    this.status = EAbstractControlStatus.pure;
    this._init(value);
  }

  // public propreties
  ModelFormState<TModel> modelState;

  /// [_init] mehtod initialize this form control.
  /// It adds validators, add default status into the model state, and adds a listener.
  void _init(Object value) {
    if (this.parentGroup != null && this.parentGroup is ModelFormGroup) {
      // set listener name
      this.listenerName = this.getListenerName(
        this.parentGroup as ModelFormGroup,
        this.name,
      );

      // set validators
      this.validators = this.getModelFormValidators(
        this.parentGroup as ModelFormGroup,
        this.name,
      );

      // add empty error record to model state
      this.modelState.actualizeAbstractControlState(
            this.listenerName,
            null,
            this.status,
          );

      // add listener, triggered when a value is changed by form user
      this._addListener(this.parentGroup as ModelFormGroup);
    }
  }

  /// [_addListener] method adds a listener on this form control.
  /// Each time a value is changed into the form, this one is notified here.
  void _addListener(ModelFormGroup parentGroup) {
    assert(parentGroup != null);

    parentGroup.current.addListener(
      () async {
        await _setValue(parentGroup);
      },
      [this.listenerName],
    );
  }

  /// [_setValue] method set this form control with the new value from form.
  /// Next, this value is validated, and the model state too.
  Future _setValue(ModelFormGroup parentGroup) async {
    assert(parentGroup != null);

    InstanceMirror instanceMirror = this.getInstanceMirror(parentGroup.current);
    this.value = this.getSubObject(instanceMirror, this.name);

    await this.validateModelForm(
      this.modelState,
      parentGroup,
      this.name,
      this.value,
      this.formPath,
      this.modelPath,
    );
  }
}
