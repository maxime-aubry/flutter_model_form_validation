import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/reflectable.dart';

enum EAbstractControlStatus {
  pure,
  valid,
  invalid,
  validationInProgress,
}

class AbstractControl<TModel extends ModelForm> {
  AbstractControl(this.name, this.parentGroup) {
    this.validators = new List<FormValidator>();
    this.status = EAbstractControlStatus.pure;
  }

  // public properties
  List<FormValidator> validators;
  ValidationError error;
  String name;
  FormGroup parentGroup;
  EAbstractControlStatus status;

  // public methods
  @protected
  InstanceMirror getInstanceMirror(Object value) {
    InstanceMirror instanceMirror = flutterModelFormValidator.reflect(value);
    return instanceMirror;
  }

  /// [getValidators] gets all validators for form element.
  @protected
  List<FormValidator> getValidators<FormValidatorType>(
    MethodMirror declaration,
  ) {
    List<FormValidator> validators = Collection(declaration.metadata)
        .where((arg1) => arg1 is FormValidator)
        .select((arg1) => arg1 as FormValidator)
        .orderBy((arg1) => arg1.criticityLevel)
        .toList();
    return validators;
  }

  /// [validate] method validate current value, update the status (pure, valid, invalid) and the model state.
  Future validate(
    ModelState<TModel> modelState,
    String name,
    Object value,
  ) async {
    bool isValid = true;
    this.error = null;

    print(
        'Validating form element "${this.getListenerName()}" with status ${this.status}...');

    // before validation
    this.status = EAbstractControlStatus.validationInProgress;
    modelState.actualizeAbstractControlState(
      this.getListenerName(),
      null,
      this.status,
    );

    // validation
    for (FormValidator validator in this.validators) {
      try {
        isValid = await validator.isValid(
          modelState.formBuilder,
          this.parentGroup,
          value,
        );

        print('Validator @${validator.runtimeType} returns ${isValid}.');

        if (!isValid) {
          this.error = ValidationError(
            propertyName: this.name,
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
      this.getListenerName(),
      this.error,
      this.status,
    );
  }

  String getListenerName() {
    String listenerName = '${this.parentGroup.current.hashCode}.${this.name}';
    return listenerName;
  }
}
