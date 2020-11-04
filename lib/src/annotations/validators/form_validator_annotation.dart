import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';

/// [FormValidatorAnnotation] is the parent class for every validators you will create and use.
/// {@category Metadata}
/// {@subCategory FormDeclarators}
abstract class FormValidatorAnnotation<TValue> {
  const FormValidatorAnnotation({
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
  Future<bool> isValid(
    FormBuilderBase formBuilder,
    FormGroupBase formGroup,
    TValue value,
    String formPath,
    String modelFormPath,
  );

  Object getLinkedProperty<TValue>(
    FormGroupBase formGroup,
    String propertyName,
    Object defaultValue,
  ) {
    try {
      DateTime dtValue = null;
      if (TValue == DateTime && defaultValue != null) {
        if (defaultValue is! String) throw new Exception();
        dtValue = (defaultValue as String).toDateTime();
      }

      if (propertyName == null || propertyName.isEmpty)
        return dtValue ?? defaultValue;
      if (!formGroup.containsControl(propertyName))
        return dtValue ?? defaultValue;
      if (formGroup.controls[propertyName] is! FormControlBase)
        return dtValue ?? defaultValue;
      FormControlBase formControl =
          formGroup.controls[propertyName] as FormControlBase;
      TValue value = formControl.value as TValue;
      return value;
    } catch (e) {
      throw new RemotePropertyException(
          'An error occurred when trying to get remote property');
    }
  }
}
