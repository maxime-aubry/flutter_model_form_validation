import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';

class AbstractControl {
  AbstractControl(List<FormValidatorAnnotation> validators) {
    this.controlName = null;
    this.parentGroup = null;
    this.validators = validators;
    this.validation_status = EAbstractControlStatus.pure;
    this.isInitialized = false;
  }

  FormGroup parentGroup;

  @protected
  String controlName;

  @protected
  List<FormValidatorAnnotation> validators;

  @protected
  EAbstractControlStatus validation_status;

  @protected
  ValidationError validation_error;

  @protected
  bool isInitialized;

  String get name => this.controlName;
  EAbstractControlStatus get status => this.validation_status;
  ValidationError get error {
    if (this.validation_error == null) return null;

    return this.validation_error.copyWith(
          propertyName: this.validation_error.propertyName,
          validatorType: this.validation_error.validatorType,
          message: this.validation_error.message,
        );
  }

  String get fullname {
    if (this.controlName == null || this.controlName.isEmpty) return null;
    if (this.controlName == 'root' && this.parentGroup == null) return null;
    return '${this.parentGroup.hashCode}.${this.controlName}';
  }

  @protected
  Future<void> validateControl(
    Object value,
    String formPath,
    String modelPath,
  ) async {
    bool isValid = true;
    this.validation_error = null;
    FormBuilder formBuilder = this.getFormBuilder();

    // before validation
    this.validation_status = EAbstractControlStatus.validationInProgress;
    formBuilder.formState.update(
      this.fullname,
      null,
      this.validation_status,
    );

    // validation
    for (FormValidatorAnnotation validator in this.validators.reorder()) {
      try {
        isValid = await validator.isValid(
          formBuilder.formState.formBuilder,
          parentGroup,
          value,
          formPath,
          modelPath,
        );

        if (!isValid) {
          this.validation_error = ValidationError(
            name,
            validator.runtimeType,
            validator.error,
          );
          break;
        }
      } on TypeError catch (_) {
        isValid = false;
      } on ValidationException catch (_) {
        isValid = false;
      }
    }

    // after validation
    this.validation_status =
        isValid ? EAbstractControlStatus.valid : EAbstractControlStatus.invalid;
    formBuilder.formState.update(
      this.fullname,
      this.error, // error is an immutable copy of validation_error
      this.validation_status,
    );
  }

  @protected
  FormBuilder getFormBuilder() {
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

    return firstFormGroup.formBuilder;
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
