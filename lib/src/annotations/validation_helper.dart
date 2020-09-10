import 'package:reflectable/reflectable.dart';
import 'flutter_model_form_validator.dart';

/// [ValidationHelper] somes utilities for validators
/// {@category Validation helpers}
class ValidationHelper {
  /// Gets the linked property referenced into a validator.
  /// For example, GreaterThan validator must accept a String argument to target another property in the model.
  static Object getLinkedProperty<TModel, TValue>(
      TModel model, String propertyName) {
    try {
      if (propertyName == null) return null;
      InstanceMirror instanceMirror = flutterModelFormValidator.reflect(model);
      TValue valueToCompare =
          instanceMirror.invokeGetter(propertyName) as TValue;
      return valueToCompare;
    } catch (_) {
      return null;
    }
  }

  /*/// Gets a default validation for each validator using a target property.
  /// If current property is null, returns true. There is nothing to validate, so the model is valid.
  /// If target property is null, returns false. A referenced value is required if data is available for validation.
  /// If current property and target property have values, so returns null. So we can continue the validation.
  static bool getDefaultValidation<TValue>(
      TValue value, Object valueToCompare) {
    if (value == null) return true;
    if (valueToCompare == null) return false;
    return null;
  }*/

  /*static bool validateProperty<TValue, TValueOnProperty>(
      TValue value, TValueOnProperty valueOnProperty) {
    if (value != null) return true;
    if (value == null && valueOnProperty != null) return true;
    return false;
  }*/
}
