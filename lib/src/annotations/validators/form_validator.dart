import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/form_declarers/flutter_model_form_validator.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:reflectable/reflectable.dart';

/// [FormValidator] is the parent class for every validators you will create and use.
/// {@category Metadata}
/// {@subCategory FormDeclarators}
abstract class FormValidator<TValue> {
  const FormValidator({
    @required this.criticityLevel,
    @required this.error,
  });

  /// This reprensents the order of execution for validation. If a validator returns false, the queue will stop on this point. Nexts validators won't be fired.
  final int criticityLevel;

  /// This is the error to display (provided by developers).
  final String error;

  /// Verify if the model is valid compared to the current validator You must add [value] parameter, this one is your current property to validate.
  /// [model] parameter is also required, even if your custom validator won't use it.
  /// It reprensents your full object model with all values.
  /// Maybe you would validate a property in comparison to others.
  Future<bool> isValid<TModel extends PropertyChangeNotifier<String>>(
    FormBuilder<TModel> formBuilder,
    FormGroup formGroup,
    TValue value,
  );

  /// Gets the linked property referenced into a validator.
  /// For example, GreaterThan validator must accept a String argument to target another property in the model.
  Object
      getLinkedProperty<TModel extends PropertyChangeNotifier<String>, TValue>(
    TModel model,
    TValue defaultValue,
    String propertyName,
  ) {
    try {
      if (propertyName == null) return defaultValue;
      InstanceMirror instanceMirror = flutterModelFormValidator.reflect(model);
      TValue valueToCompare =
          instanceMirror.invokeGetter(propertyName) as TValue;
      if (valueToCompare != null) return valueToCompare;
      return defaultValue;
    } catch (_) {
      return defaultValue;
    }
  }
}
