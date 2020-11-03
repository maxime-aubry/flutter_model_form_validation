import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';
import 'package:queries/collections.dart';

mixin DynamicFormValidator {
  // private properties
  String _listenerName;

  // public properties
  @protected
  EAbstractControlStatus status;

  @protected
  FormState formState;
  List<FormValidatorAnnotation> validators;
  ValidationError error;

  // getters
  String get listenerName => this._listenerName;

  // private methods
  List<FormValidatorAnnotation> _getValidators<FormValidatorType>() {
    List<FormValidatorAnnotation> validators = Collection(this.validators)
        .orderBy((arg1) => arg1.criticityLevel)
        .toList();
    return validators;
  }

  // public methods
  @protected
  void initialize(FormGroup parentGroup, String name) {
    assert(parentGroup != null);
    assert(name != null);
    assert(name != '');

    this._listenerName = '${parentGroup.hashCode}.${name}';

    // add empty error record to model state
    this.formState.update(
          this._listenerName,
          null,
          this.status,
        );
  }

  /// [validate] method validate current value, update the status (pure, valid, invalid) and the model state.
  @protected
  Future validate$1(
    FormStateBase formState,
    FormGroup parentGroup,
    String name,
    Object value,
    String formPath,
    String modelPath,
  ) async {
    bool isValid = true;
    this.error = null;

    print(
        'Validating form element "${this._listenerName}" with status ${this.status}...');

    // before validation
    this.status = EAbstractControlStatus.validationInProgress;
    formState.update(
      this._listenerName,
      null,
      this.status,
    );

    // validation
    for (FormValidatorAnnotation validator in this._getValidators()) {
      try {
        isValid = await validator.isValid(
          formState.formBuilder,
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
    formState.update(
      this._listenerName,
      this.error,
      this.status,
    );
  }
}
