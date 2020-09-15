import 'package:flutter_model_form_validation/src/annotations/flutter_model_form_validator.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_annotation.dart';
import 'package:flutter_model_form_validation/src/annotations/validation_error.dart';
import 'package:reflectable/reflectable.dart';

class ModelState {
  static Map<String, ValidationError> _errors;

  /// Gets the state of current [model] binding of [TModel] type.
  /// Browses all declared metadata of [ValidationAnnotation] type, for each property into your class model.
  /// Then, executes "IsValid" method that returns true or false. For each property, first of them that returns false invalidates your property, and so, your model. If there is none, your property and model are valid.
  static bool isValid<TModel>(
    TModel model,
  ) {
    try {
      InstanceMirror instanceMirror = flutterModelFormValidator.reflect(model);
      ClassMirror classMirror = flutterModelFormValidator.reflectType(TModel);
      _errors = Map<String, ValidationError>();

      for (MapEntry<String, DeclarationMirror> item
          in classMirror.declarations.entries) {
        ValidationError error = _validateProperty(
          item.key,
          item.value,
          instanceMirror,
          model,
        );
        if (error != null) _errors[item.key] = error;
      }

      return _errors.isEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static ValidationError _validateProperty<TModel>(
    String key,
    DeclarationMirror declarationMirror,
    InstanceMirror instanceMirror,
    TModel model,
  ) {
    ValidationError error;
    List<ValidationAnnotation> annotations =
        _getValidators(declarationMirror.metadata);

    for (ValidationAnnotation annotation in annotations) {
      Object value = instanceMirror.invokeGetter(key);
      bool isValid = annotation.isValid(value, model);
      if (!isValid) {
        error = ValidationError(
          propertyName: key,
          validatorType: annotation.runtimeType,
          error: annotation.error,
        );
        break;
      }
    }

    return error;
  }

  static List<ValidationAnnotation> _getValidators(List<Object> metadata) {
    List<ValidationAnnotation> validators = new List<ValidationAnnotation>();
    for (Object metadatum in metadata)
      if (metadatum is ValidationAnnotation) validators.add(metadatum);
    validators.sort((a, b) => a.criticityLevel.compareTo(b.criticityLevel));
    return validators;
  }

  /// Gets all errors that flutterModelFormValidator has detected.
  static Map<String, ValidationError> get errors {
    return ModelState._errors;
  }
}
