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
  List<FormValidatorAnnotation> validators;
  ValidationError error;
  EAbstractControlStatus status;

  InstanceMirror getInstanceMirror(Object value) {
    InstanceMirror instanceMirror = flutterModelFormValidator.reflect(value);
    return instanceMirror;
  }

  /// [getValidators] gets all validators for form element.
  List<FormValidatorAnnotation> getModelFormValidators<FormValidatorType>(
    MethodMirror declaration,
  ) {
    List<FormValidatorAnnotation> validators = Collection(declaration.metadata)
        .where((arg1) => arg1 is FormValidatorAnnotation)
        .select((arg1) => arg1 as FormValidatorAnnotation)
        .orderBy((arg1) => arg1.criticityLevel)
        .toList();
    return validators;
  }

  /// [validate] method validate current value, update the status (pure, valid, invalid) and the model state.
  Future validateModelForm(
    ModelFormState<TModel> modelState,
    ModelFormGroup parentGroup,
    String name,
    Object value,
  ) async {
    bool isValid = true;
    this.error = null;

    String listenerName = this.getListenerName(parentGroup, name);

    print(
        'Validating form element "${listenerName}" with status ${this.status}...');

    // before validation
    this.status = EAbstractControlStatus.validationInProgress;
    modelState.actualizeAbstractControlState(
      listenerName,
      null,
      this.status,
    );

    // validation
    for (FormValidatorAnnotation validator in this.validators) {
      try {
        isValid = await validator.isValid(
          modelState.formBuilder,
          parentGroup,
          value,
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
      listenerName,
      this.error,
      this.status,
    );
  }

  String getListenerName(ModelFormGroup parentGroup, String property) {
    String listenerName = '${parentGroup.current.hashCode}.$property';
    return listenerName;
  }
}