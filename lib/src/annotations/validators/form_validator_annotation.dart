import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

/// [FormValidatorAnnotation] is the parent class for every validators you will create and use.
/// {@category Metadata}
/// {@subCategory FormDeclarators}
abstract class FormValidatorAnnotation<
    TAbstractControl extends AbstractControl> {
  const FormValidatorAnnotation({
    this.serviceName,
    @required this.error,
  });

  /// [serviceName] allows to use a service to load data.
  final String serviceName;

  /// [error] is the error to display.
  final String error;

  /// Verify if the model is valid compared to the current validator You must add [value] parameter, this one is your current property to validate.
  /// [model] parameter is also required, even if your custom validator won't use it.
  /// It reprensents your full object model with all values.
  /// Maybe you would validate a property in comparison to others.
  Future<bool> isValid(TAbstractControl control);

  FormGroup getFormGroup(
    AbstractControl control,
    String name,
  ) {
    if (name == null || name.isEmpty) return null;
    return control.parentGroup.getFormGroup(name);
  }

  FormArray getFormArray(
    AbstractControl control,
    String name,
  ) {
    if (name == null || name.isEmpty) return null;
    return control.parentGroup.getFormArray(name);
  }

  FormControl<TProperty> getFormControl<TProperty>(
    AbstractControl control,
    String name,
  ) {
    if (name == null || name.isEmpty) return null;
    return control.parentGroup.getFormControl<TProperty>(name);
  }

  TProperty getValidatorParameter<TProperty>(
    AbstractControl control,
    String property,
    TProperty defaultValue,
  ) {
    //#region locales methods
    TProperty getCastedDefaultValue(TProperty defaultValue) {
      if (defaultValue == null) return null;

      if (TProperty == DateTime) {
        if (defaultValue is! ConstantDateTime) {
          throw new ValidationException(
            '''Cannot get datetime from remote parameter.
            This one is not a ConstantDateTime object, its type is $TProperty.
            Please, provide a ConstantDateTime object, just like this :
            @Validator(parameter: ConstantDateTime('yyyy-MM-ddTHH:mm:ssZ'))''',
          );
        }
        defaultValue =
            (defaultValue as ConstantDateTime).toDateTime() as TProperty;
      }

      return defaultValue;
    }

    TProperty getRemoteParameter(AbstractControl control, String property) {
      TProperty remoteParameter =
          this.getFormControl<TProperty>(control, property)?.value;
      return remoteParameter;
    }

    TProperty getParameter(TProperty defaultValue) {
      if (property == null || property.isEmpty) return defaultValue;

      TProperty remoteParameter = getRemoteParameter(control, property);
      return remoteParameter;
    }
    //#endregion

    defaultValue = getCastedDefaultValue(defaultValue);
    TProperty parameter = getParameter(defaultValue);
    return parameter;
  }
}
