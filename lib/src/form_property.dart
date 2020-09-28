import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/reflectable.dart';

enum InputStatus {
  pure,
  validationInProgress,
  valid,
  invalid,
}

class FormProperty {
  FormProperty(
      this._name, this._value, this._status, this._validators, this._error);

  String _name;
  Object _value;
  InputStatus _status;
  List<ValidationAnnotation> _validators;
  ValidationError _error;

  // getters
  String get name => this._name;
  Object get value => this._value;
  InputStatus get status => this._status;
  List<ValidationAnnotation> get validators => this._validators;
  ValidationError get error => this._error;

  static FormProperty init<TModel>(TModel model, VariableMirror declaration) {
    InstanceMirror instanceMirror = flutterModelFormValidator.reflect(model);
    Object value = instanceMirror.invokeGetter(declaration.simpleName);
    FormProperty property = new FormProperty(
      declaration.simpleName,
      value,
      InputStatus.pure,
      FormProperty._getValidators(declaration),
      null,
    );
    return property;
  }

  static List<ValidationAnnotation> _getValidators(
    VariableMirror declaration,
  ) {
    List<ValidationAnnotation> validators = Collection(declaration.metadata)
        .where((arg1) => arg1 is ValidationAnnotation)
        .select((arg1) => arg1 as ValidationAnnotation)
        .orderBy((arg1) => arg1.criticityLevel)
        .toList();
    return validators;
  }

  Future update<TModel>(TModel model) async {
    InstanceMirror instanceMirror = flutterModelFormValidator.reflect(model);
    this._value = instanceMirror.invokeGetter(this._name);
    this._status = InputStatus.validationInProgress;
    this._status =
        await this._validate(model) ? InputStatus.valid : InputStatus.invalid;
  }

  Future<bool> _validate<TModel>(TModel model) async {
    bool isValid = true;
    this._error = null;

    for (ValidationAnnotation validator in this._validators) {
      isValid = await validator.isValid(this._value, model);
      if (!isValid) {
        this._error = ValidationError(
          propertyName: this._name,
          validatorType: validator.runtimeType,
          error: validator.error,
        );
        break;
      }
    }
    return isValid;
  }

  void setServerError(String error) {
    this._error = new ValidationError(
        propertyName: this.name, validatorType: null, error: error);
  }
}
