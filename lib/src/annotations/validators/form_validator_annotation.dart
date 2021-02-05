import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

/// [FormValidatorAnnotation] is the parent class for every validators you will create and use.
/// {@category Metadata}
/// {@subCategory FormDeclarators}
abstract class FormValidatorAnnotation {
  const FormValidatorAnnotation({
    @required this.error,
  });

  /// This is the error to display (provided by developers).
  final String error;

  /// Verify if the model is valid compared to the current validator You must add [value] parameter, this one is your current property to validate.
  /// [model] parameter is also required, even if your custom validator won't use it.
  /// It reprensents your full object model with all values.
  /// Maybe you would validate a property in comparison to others.
  Future<bool> isValid(
    FormGroup root,
    FormGroup formGroup,
    String property,
  );

  TProperty getRemoteValue<TProperty>(
    FormGroup formGroup,
    String propertyName,
    TProperty developerValue,
  ) {
    // if the user did not provide a value, let return the developer one
    if (propertyName == null || propertyName.isEmpty) return developerValue;

    // else if the user provided a value, let return it
    // if current form group does not contain the property name, return the develop value
    if (!formGroup.containsControl(propertyName)) return developerValue;

    // if targeted property is not a form control, throw an exception
    if (formGroup.controls[propertyName] is! FormControl<TProperty>)
      throw new RemotePropertyException(
          'Targeted property must be a form control of $TProperty type.');

    // else, get the value from form control, cast it as wanted type and return it
    FormControl<TProperty> formControl =
        formGroup.controls[propertyName] as FormControl<TProperty>;
    return formControl.value ?? developerValue ?? null;
  }
}
