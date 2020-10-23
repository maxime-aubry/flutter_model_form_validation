import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/form_validator_attribute.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_error.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/reflectable.dart';

enum EAbstractControlStatus {
  pure,
  valid,
  invalid,
  validationInProgress,
}

class AbstractControl {
  AbstractControl();

  // public properties
  List<FormValidatorAttribute> validators;
  ValidationError error;

  // public methods
  InstanceMirror getInstanceMirror(Object value) {
    InstanceMirror instanceMirror = flutterModelFormValidator.reflect(value);
    return instanceMirror;
  }

  List<FormValidatorAttribute> getValidators(
    MethodMirror declaration,
  ) {
    List<FormValidatorAttribute> validators = Collection(declaration.metadata)
        .where((arg1) => arg1 is FormValidatorAttribute)
        .select((arg1) => arg1 as FormValidatorAttribute)
        .orderBy((arg1) => arg1.criticityLevel)
        .toList();
    return validators;
  }
}
