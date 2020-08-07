import 'package:reflectable/reflectable.dart';
import 'annotations/flutter_model_form_validator.dart';
import '../src/annotations/validation_annotation.dart';
import '../src/annotations/validation_error.dart';

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

      classMirror.declarations
          .forEach((String propertyName, DeclarationMirror declarationMirror) {
        ValidationError error = _validateProperty(
          propertyName,
          declarationMirror,
          instanceMirror,
          model,
        );
        if (error != null) _errors[propertyName] = error;
      });

      return _errors.isEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// Gets the state of current [propertyName] into the [model] binding of [TModel] type.
  /// Browses all declared metadata of [ValidationAnnotation] type for property.
  /// Then, executes "IsValid" method that returns true or false. First of them that retuns false invalidates your property. If there is none, your property is valid.
  static bool isValidProperty<TModel>(
    TModel model,
    String propertyName,
  ) {
    try {
      InstanceMirror instanceMirror = flutterModelFormValidator.reflect(model);
      ClassMirror classMirror = flutterModelFormValidator.reflectType(TModel);
      DeclarationMirror declarationMirror =
          classMirror.declarations[propertyName];
      _errors = Map<String, ValidationError>();

      if (declarationMirror != null) {
        ValidationError error = _validateProperty(
          propertyName,
          declarationMirror,
          instanceMirror,
          model,
        );
        if (error != null) _errors[propertyName] = error;
      } else {
        throw Exception('No property found for this name in this object');
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
