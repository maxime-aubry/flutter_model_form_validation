import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';

class AbstractControl {
  AbstractControl(List<FormValidatorAnnotation> validators) {
    this.controlName = null;
    this.parentGroup = null;
    this.validators = validators;
    this.status = EAbstractControlStatus.pure;
    this.isInitialized = false;
  }

  @protected
  String controlName;

  @protected
  FormGroup parentGroup;

  @protected
  List<FormValidatorAnnotation> validators;

  @protected
  EAbstractControlStatus status;

  @protected
  bool isInitialized;

  String get name => this.controlName;
  String get fullname {
    if (this.controlName == null || this.controlName.isEmpty) return null;
    if (this.controlName == 'root' && this.parentGroup == null) return null;
    return '${this.hashCode}.${this.controlName}';
  }

  @protected
  Future<void> validateControl(
    Object value,
    String formPath,
    String modelPath,
  ) async {
    bool isValid = true;
    ValidationError error = null;
    FormStateBase formState = this.getFormState();

    // before validation
    this.status = EAbstractControlStatus.validationInProgress;
    formState.update(
      this.fullname,
      null,
      this.status,
    );

    // validation
    for (FormValidatorAnnotation validator in this.validators.reorder()) {
      try {
        isValid = await validator.isValid(
          formState.formBuilder,
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
    this.status =
        isValid ? EAbstractControlStatus.valid : EAbstractControlStatus.invalid;
    formState.update(
      this.fullname,
      error,
      this.status,
    );
  }

  @protected
  FormStateBase getFormState() {
    FormGroup firstFormGroup;

    if (this.parentGroup != null) {
      firstFormGroup = this._getParentGroup(this.parentGroup);
    } else if (this is FormGroup &&
        this.name == 'root' &&
        this.parentGroup == null) {
      firstFormGroup = this;
    }

    if (firstFormGroup == null)
      throw new Exception('Cannot get first form group.');

    if (firstFormGroup.formBuilder == null)
      throw new Exception('Form builder is not located.');

    if (firstFormGroup.formBuilder.formState == null)
      throw new Exception('Form state is not located.');

    return firstFormGroup.formBuilder.formState;
  }

  FormGroup _getParentGroup(
    AbstractControl control,
  ) {
    if (control.parentGroup != null)
      return this._getParentGroup(control.parentGroup);

    if (control is! FormGroup)
      throw new Exception(
          'Cannot return a form control that is not a form group.');

    return control;
  }
}
