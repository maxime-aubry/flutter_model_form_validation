import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class AbstractControl extends ChangeNotifier {
  AbstractControl(List<FormValidatorAnnotation> validators) {
    this.name = null;
    this.parentGroup = null;
    this.validators = validators ?? [];
    this.status = EAbstractControlStatus.pure;
    this.isInitialized = false;
  }

  @protected
  List<FormValidatorAnnotation> validators;

  FormGroup parentGroup;
  String name;
  EAbstractControlStatus status;
  ValidationError error;
  bool isInitialized;

  @protected
  Future<void> validateControl(
    Object value,
    String formPath,
    String modelPath,
  ) async {
    bool isValid = true;
    this.error = null;

    // before validation
    this.status = EAbstractControlStatus.validationInProgress;
    super.notifyListeners();

    // validation
    for (FormValidatorAnnotation validator in this.validators) {
      try {
        isValid = await validator.isValid(
          null,
          parentGroup,
          value,
          formPath,
          modelPath,
        );

        if (!isValid) {
          this.error = ValidationError(
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
    this.status =
        isValid ? EAbstractControlStatus.valid : EAbstractControlStatus.invalid;
    super.notifyListeners();
  }

  @protected
  ReactiveFormBuilder getFormBuilder() {
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
