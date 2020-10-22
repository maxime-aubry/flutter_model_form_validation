import 'package:flutter_model_form_validation/src/annotations/form_declarers/form_validator.dart';
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
  AbstractControl([MethodMirror declaration]) {
    if (declaration != null) this._init(declaration);
  }

  // public properties
  List<FormValidator> _validators;
  ValidationError _error;

  // getters
  List<FormValidator> get validators => this._validators;
  ValidationError get error => this._error;

  // setter
  set error(ValidationError value) {
    this._error = value;
  }

  // private methods
  void _init(MethodMirror declaration) {
    this._validators = this.getValidators(declaration);
    this._error = null;
  }

  // public methods
  List<FormValidator> getValidators(
    MethodMirror declaration,
  ) {
    List<FormValidator> validators = Collection(declaration.metadata)
        .where((arg1) => arg1 is FormValidator)
        .select((arg1) => arg1 as FormValidator)
        .orderBy((arg1) => arg1.criticityLevel)
        .toList();
    return validators;
  }
}
