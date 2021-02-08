import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/model_form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class ModelFormControl<TField> extends FormControl<TField>
    with ReflectableForm {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */
  @override
  ModelFormState get formState => super.formState;

  @override
  ModelFormGroup get parentGroup => super.parentGroup;

  // String get modelPartuniqueName {
  //   if (this.name == null || this.name.isEmpty) return null;
  //   if (this.name == 'root' && this.parentGroup == null) return null;
  //   ModelFormGroup parentGroup2 = this.parentGroup as ModelFormGroup;
  //   return '${parentGroup2.model.hashCode}.${this.name}';
  // }

  /* Setters */

  /* Constructors */
  ModelFormControl({
    @required ModelFormState formState,
    @required TField value,
  }) : super(
          value: value,
          validators: [],
        );

  /* Public methods */
  @override
  void initialize(
    String name,
    FormGroup parentGroup,
    ReactiveFormState formState,
  ) {
    if (name == null || name.isEmpty)
      throw new FormBuilderException(
          'Cannot initialize ModelFormControl if its name is not provided.');

    if (this.isInitialized)
      throw new FormBuilderException(
          'Cannot initialize an already initialized ModelFormControl.');

    if (formState is! ModelFormState)
      throw new FormBuilderException(
          'Cannot initialize ModelFormControl with a non-ModelFormState.');

    super.name = name;
    super.parentGroup = parentGroup;
    super.formState = formState;
    super.index();
    super.validators = super.getValidators(this.parentGroup.model, this.name);
    this._listenValueAndUpdate(this.parentGroup);
    super.isInitialized = true;
  }

  @override
  Future validate() async => await super.validateControl();

  /* Protected methods */

  /* Private methods */
  void _listenValueAndUpdate(ModelFormGroup parentGroup) {
    FormControlElement formElement = super.getModelPart<FormControlElement>(
      parentGroup.model,
      this.name,
    );
    formElement.addListener(() {
      this.value = formElement.value;
    });
  }
}
