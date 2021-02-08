import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/form_control_filter/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class FormControl<TProperty> extends AbstractControl
    with FormControlFilter<TProperty> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */
  TProperty _value;

  /* Getters */
  TProperty get value => this._value;

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

  /* Setters */
  @protected
  void set value(TProperty value) {
    this._value = value;
  }

  /* Constructors */
  FormControl({
    @required TProperty value,
    @required List<FormValidatorAnnotation> validators,
  }) : super(validators) {
    // check if TProperty is an alloew type
    // throw an exception if not
    super.checkAllowedFormControlType();
    this._value = value;
  }

  /* Public methods */
  void initialize(
    String name,
    FormGroup parentGroup,
    ReactiveFormState formState,
  ) {
    if (name == null || name.isEmpty)
      throw new FormBuilderException(
          'Cannot initialize form control if its name is not provided.');

    if (this.isInitialized)
      throw new FormBuilderException(
          'Cannot initialize an already initialized form control.');

    super.name = name;
    super.parentGroup = parentGroup;
    super.formState = formState;
    super.index();
    super.isInitialized = true;
  }

  Future<void> setValue(TProperty value) async {
    this._value = value;
    await super.validateControl();
  }

  // FormControl<TProperty> clone(FormGroup clonedParent) {
  //   TProperty newValue = (this._value is List)
  //       ? ([]..addAll(this._value as List<TProperty>))
  //       : this._value;

  //   FormControl<TProperty> clone = new FormControl<TProperty>(
  //     value: newValue,
  //     validators: super.validators,
  //   );

  //   clone.initialize(super.name, clonedParent);
  //   clone.error = super.error?.copyWith();
  //   return clone;
  // }

  Future<void> validate() async => await super.validateControl();

  /* Protected methods */

  /* Private methods */
}
