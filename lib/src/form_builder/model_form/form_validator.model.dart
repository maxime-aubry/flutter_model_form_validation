import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/reflectable.dart';

mixin ModelFormValidator<TModel extends ModelForm> {
  String _listenerName;
  EAbstractControlStatus _status;
  @protected
  ModelFormState<TModel> formState;
  List<FormValidatorAnnotation> validators;
  ValidationError error;
  String get listenerName => this._listenerName;
  EAbstractControlStatus get status => this._status;

  // private methods
  @protected
  void initialize(
    String name,
    ModelFormGroup parentGroup,
    ModelFormState<TModel> formState,
    Function setValue,
  ) {
    this._listenerName = '${parentGroup.current.hashCode}.$name';
    this._status = EAbstractControlStatus.pure;

    // set validators
    this.validators = this._getValidators(parentGroup, name);

    // add empty error record to model state
    this.formState = formState;
    this.formState.update(
          this._listenerName,
          null,
          this._status,
        );

    // add listener, triggered when a sub-object is added or removed by form user
    this._addListener(parentGroup, setValue);
  }

  /// [_addListener] method adds a listener on this form control.
  /// Each time a value is changed into the form, this one is notified here.
  void _addListener(ModelFormGroup parentGroup, Function setValue) {
    parentGroup.current.addListener(
      () async {
        await setValue();
      },
      [this._listenerName],
    );
  }

  /// [_getValidators] gets all validators for form element.
  List<FormValidatorAnnotation> _getValidators<FormValidatorType>(
    ModelFormGroup parentGroup,
    String property,
  ) {
    InstanceMirror instanceMirror = this.getInstanceMirror(parentGroup.current);
    MethodMirror methodMirror =
        instanceMirror.type.declarations[property] as MethodMirror;

    List<FormValidatorAnnotation> validators = Collection(methodMirror.metadata)
        .where((arg1) => arg1 is FormValidatorAnnotation)
        .select((arg1) => arg1 as FormValidatorAnnotation)
        .orderBy((arg1) => arg1.criticityLevel)
        .toList();
    return validators;
  }

  // public methods
  /// [validate$1] method validate current value, update the status (pure, valid, invalid) and the model state.
  @protected
  Future validate$1(
    ModelFormGroup parentGroup,
    String property,
    Object value,
    String formPath,
    String modelPath,
  ) async {
    bool isValid = true;
    this.error = null;

    print(
        'Validating form element "${this._listenerName}" with status ${this.status}...');

    // before validation
    this._status = EAbstractControlStatus.validationInProgress;
    this.formState.update(
          this._listenerName,
          null,
          this._status,
        );

    // validation
    for (FormValidatorAnnotation validator in this.validators) {
      try {
        isValid = await validator.isValid(
          this.formState.formBuilder,
          parentGroup,
          value,
          formPath,
          modelPath,
        );

        print('Validator @${validator.runtimeType} returns ${isValid}.');

        if (!isValid) {
          this.error = ValidationError(
            propertyName: property,
            validatorType: validator.runtimeType,
            message: validator.error,
          );
          break;
        }
      } on TypeError catch (_) {
        print('Unable to validate form control using by an improper validator');
        isValid = false;
      } on ValidationException catch (e) {
        print(e.message);
        isValid = false;
      }
    }

    // after validation
    this._status =
        isValid ? EAbstractControlStatus.valid : EAbstractControlStatus.invalid;
    this.formState.update(
          this._listenerName,
          this.error,
          this._status,
        );
  }

  InstanceMirror getInstanceMirror(Object value) {
    InstanceMirror instanceMirror = flutterModelFormValidator.reflect(value);
    return instanceMirror;
  }

  Object getSubObject(InstanceMirror instanceMirror, String property) {
    Object child = instanceMirror.invokeGetter(property);
    return child;
  }
}
