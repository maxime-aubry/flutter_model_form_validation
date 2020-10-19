import 'package:flutter_model_form_validation/src/annotations/flutter_model_form_validator.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_error.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/reflectable.dart';

enum InputStatus {
  pure,
  valid,
  invalid,
  validationInProgress,
}

class FormProperty<TModel> {
  FormProperty(TModel model, VariableMirror declaration)
      : assert(model != null),
        assert(declaration != null) {
    this._init(model, declaration);
  }

  String _name;
  Object _value;
  InputStatus _status;
  List<ValidationAnnotation> _validators;
  ValidationError _error;

  /// Gets the property name.
  String get name => this._name;

  /// Gets the property value.
  Object get value => this._value;

  /// Gets the input status (pure, valid, invalid, validation in progress).
  InputStatus get status => this._status;

  /// Gets the list of validators.
  List<ValidationAnnotation> get validators => this._validators;

  /// Gets the error.
  ValidationError get error => this._error;

  /// Initialize a form property.
  void _init(TModel model, VariableMirror declaration) {
    InstanceMirror instanceMirror = flutterModelFormValidator.reflect(model);
    this._name = declaration.simpleName;
    this._value = instanceMirror.invokeGetter(declaration.simpleName);
    this._status = InputStatus.pure;
    this._validators = this._getValidators(declaration);
    this._error = null;
  }

  /// Returns a list of validators for this form property.
  List<ValidationAnnotation> _getValidators(
    VariableMirror declaration,
  ) {
    List<ValidationAnnotation> validators = Collection(declaration.metadata)
        .where((arg1) => arg1 is ValidationAnnotation)
        .select((arg1) => arg1 as ValidationAnnotation)
        .orderBy((arg1) => arg1.criticityLevel)
        .toList();
    return validators;
  }

  /// Executes the validators, one after the other for this property.
  /// First of them that is invalid will stop the loop and invalidate the property.
  Future<bool> _validate(TModel model) async {
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

  /// Updates the value and validate it.
  /// The input status will be actualized.
  Future update(TModel model) async {
    InstanceMirror instanceMirror = flutterModelFormValidator.reflect(model);
    this._value = instanceMirror.invokeGetter(this._name);
    this._status = InputStatus.validationInProgress;
    this._status =
        await this._validate(model) ? InputStatus.valid : InputStatus.invalid;
  }
}
