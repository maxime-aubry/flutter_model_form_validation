import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';
import 'package:queries/collections.dart';

mixin DynamicFormValidator {
  String listenerName;
  List<FormValidatorAnnotation> validators;
  ValidationError error;
  EAbstractControlStatus status;

  /// [getValidators] gets all validators for form element.
  List<FormValidatorAnnotation> _getFormValidators<FormValidatorType>() {
    List<FormValidatorAnnotation> validators = Collection(this.validators)
        .orderBy((arg1) => arg1.criticityLevel)
        .toList();
    return validators;
  }

  /// [validate] method validate current value, update the status (pure, valid, invalid) and the model state.
  Future validateModelForm(
    FormStateBase modelState,
    FormGroup parentGroup,
    String name,
    Object value,
    String formPath,
    String modelPath,
  ) async {
    bool isValid = true;
    this.error = null;

    print(
        'Validating form element "${this.listenerName}" with status ${this.status}...');

    // before validation
    this.status = EAbstractControlStatus.validationInProgress;
    modelState.actualizeAbstractControlState(
      this.listenerName,
      null,
      this.status,
    );

    // validation
    for (FormValidatorAnnotation validator in this._getFormValidators()) {
      try {
        isValid = await validator.isValid(
          modelState.formBuilder,
          parentGroup,
          value,
          formPath,
          modelPath,
        );

        print('Validator @${validator.runtimeType} returns ${isValid}.');

        if (!isValid) {
          this.error = ValidationError(
            propertyName: name,
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
    this.status =
        isValid ? EAbstractControlStatus.valid : EAbstractControlStatus.invalid;
    modelState.actualizeAbstractControlState(
      this.listenerName,
      this.error,
      this.status,
    );
  }

  String getListenerName(FormGroup parentGroup, String property) {
    String listenerName = '${parentGroup.hashCode}.${property}';
    return listenerName;
  }
}
