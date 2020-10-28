import 'package:flutter_model_form_validation/src/annotations/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/validation_error.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/model_state.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/reflectable.dart';

enum EAbstractControlStatus {
  pure,
  valid,
  invalid,
  validationInProgress,
}

class AbstractControl<TModel extends PropertyChangeNotifier<String>> {
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
  InstanceMirror getInstanceMirror(Object value) {
    InstanceMirror instanceMirror = flutterModelFormValidator.reflect(value);
    return instanceMirror;
  }

  /// [getValidators] gets all validators for form element.
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

    print('Validating object "${name}" with status ${this.status}...');

    // before validation
    this.status = EAbstractControlStatus.validationInProgress;
    modelState.actualizeAbstractControlState(
      '${this.parentGroup.current.hashCode}.${this.name}',
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
        print(e);
        isValid = false;
      }
    }

    // after validation
    this.status =
        isValid ? EAbstractControlStatus.valid : EAbstractControlStatus.invalid;
    modelState.actualizeAbstractControlState(
      '${this.parentGroup.current.hashCode}.${this.name}',
      this.error,
      this.status,
    );
  }
}
