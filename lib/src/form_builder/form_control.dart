import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/model_state.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:reflectable/mirrors.dart';

class FormControl<TModel extends PropertyChangeNotifier<String>>
    extends AbstractControl<TModel> {
  FormControl(
    ModelState<TModel> modelState,
    Object value,
    String name,
    FormGroup parentGroup,
  )   : assert(modelState != null),
        assert(name != null),
        assert(parentGroup != null),
        super(name, parentGroup) {
    this.modelState = modelState;
    this.value = value;
    this._init(value);
  }

  // public properties
  ModelState<TModel> modelState;
  Object value;

  /// [_init] mehtod initialize this form control.
  /// It adds validators, add default status into the model state, and adds a listener.
  void _init(Object value) {
    if (this.parentGroup != null) {
      InstanceMirror instanceMirror =
          this.getInstanceMirror(this.parentGroup.current);
      MethodMirror methodMirror =
          instanceMirror.type.declarations[this.name] as MethodMirror;

      // add validators
      this.validators = this.getValidators(methodMirror);

      // add empty error record to model state
      this.modelState.actualizeAbstractControlState(
            '${this.parentGroup.current.hashCode}.${this.name}',
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
    this.parentGroup.current.addListener(
      () async {
        await _setValue();
      },
      ['${this.parentGroup.current.hashCode}.${this.name}'],
    );
  }

  /// [_setValue] method set this form control with the new value from form.
  /// Next, this value is validated, and the model state too.
  Future _setValue() async {
    InstanceMirror instanceMirror =
        this.getInstanceMirror(this.parentGroup.current);
    this.value = instanceMirror.invokeGetter(this.name);
    await this.validate(this.modelState, this.name, this.value);
  }
}
