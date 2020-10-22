import 'package:reflectable/reflectable.dart';
import '../flutter_model_form_validator.dart';

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
}
