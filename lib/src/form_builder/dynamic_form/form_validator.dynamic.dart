import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';
import 'package:queries/collections.dart';

mixin DynamicFormValidator {
  String _listenerName;
  EAbstractControlStatus _status;
  @protected
  DyanmicFormState formState;
  @protected
  List<FormValidatorAnnotation> validators;

  String get listenerName => this._listenerName;
  EAbstractControlStatus get status => this._status;

  @protected
  void initialize(String name, FormGroup parentGroup, DyanmicFormState formState) {
    this._status = EAbstractControlStatus.pure;
    this.formState = formState;

    if (parentGroup != null) {
      this._listenerName = '${parentGroup.hashCode}.${name}';
      this.formState.update(
            this._listenerName,
            null,
            this.status,
          );
      this.formState.addFormStateListener(this._listenerName);
    }
  }

  @protected
  void destroy() {
    this.formState.removeFormStateListener(this._listenerName);
  }

  List<FormValidatorAnnotation> _getValidators<FormValidatorType>() {
    List<FormValidatorAnnotation> validators = Collection(this.validators)
        .orderBy((arg1) => arg1.criticityLevel)
        .toList();
    return validators;
  }

  /// [validate] method validate current value, update the status (pure, valid, invalid) and the model state.
  @protected
  Future validate$1(
    FormGroup parentGroup,
    String name,
    Object value,
    String formPath,
    String modelPath,
  ) async {
    bool isValid = true;
    ValidationError error = null;

    // before validation
    this._status = EAbstractControlStatus.validationInProgress;
    this.formState.update(
          this._listenerName,
          null,
          this.status,
        );

    // validation
    for (FormValidatorAnnotation validator in this._getValidators()) {
      try {
        isValid = await validator.isValid(
          this.formState.formBuilder,
          parentGroup,
          value,
          formPath,
          modelPath,
        );

        if (!isValid) {
          error = ValidationError(name, validator.runtimeType, validator.error);
          break;
        }
      } on TypeError catch (_) {
        isValid = false;
      } on ValidationException catch (_) {
        isValid = false;
      }
    }

    // after validation
    this._status =
        isValid ? EAbstractControlStatus.valid : EAbstractControlStatus.invalid;
    this.formState.update(
          this._listenerName,
          error,
          this.status,
        );
  }
}
