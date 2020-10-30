import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:reflectable/reflectable.dart';

class ModelFormControl<TModel extends ModelForm> extends FormControl
    with ModelFormValidator {
  ModelFormControl(
    ModelFormState<TModel> modelState,
    Object value,
    String name,
    FormGroup parentGroup,
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
      ModelFormGroup modelFormGroup = this.parentGroup as ModelFormGroup;
      InstanceMirror instanceMirror =
          this.getInstanceMirror(modelFormGroup.current);
      MethodMirror methodMirror =
          instanceMirror.type.declarations[this.name] as MethodMirror;

      // add validators
      this.validators = this.getModelFormValidators(methodMirror);

      // add empty error record to model state
      String listenerName = this.getListenerName(
        this.parentGroup as ModelFormGroup,
        this.name,
      );
      this.modelState.actualizeAbstractControlState(
            listenerName,
            null,
            this.status,
          );

      // add listener, triggered when a value is changed by form user
      this._addListener();
    }
  }

  /// [_addListener] method adds a listener on this form control.
  /// Each time a value is changed into the form, this one is notified here.
  void _addListener() {
    if (this.parentGroup != null && this.parentGroup is ModelFormGroup) {
      ModelFormGroup modelFormGroup = this.parentGroup as ModelFormGroup;
      String listenerName = this.getListenerName(
        this.parentGroup as ModelFormGroup,
        this.name,
      );
      modelFormGroup.current.addListener(
        () async {
          await _setValue();
        },
        [listenerName],
      );
    }
  }

  /// [_setValue] method set this form control with the new value from form.
  /// Next, this value is validated, and the model state too.
  Future _setValue() async {
    if (this.parentGroup != null && this.parentGroup is ModelFormGroup) {
      ModelFormGroup modelFormGroup = this.parentGroup as ModelFormGroup;
      InstanceMirror instanceMirror =
          this.getInstanceMirror(modelFormGroup.current);
      this.value = instanceMirror.invokeGetter(this.name);
      await this.validateModelForm(
        this.modelState,
        modelFormGroup,
        this.name,
        this.value,
      );
    }
  }
}
