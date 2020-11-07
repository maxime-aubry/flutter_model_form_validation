import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';

/// [FormValidatorAnnotation] is the parent class for every validators you will create and use.
/// {@category Metadata}
/// {@subCategory FormDeclarators}
abstract class FormValidatorAnnotation {
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
    FormBuilderBase fb,
    FormGroupBase fg,
    Object value,
    String formPath,
    String modelFormPath,
  );

  TValue getRemoteValue<TValue>(
    FormGroupBase formGroup,
    String propertyName,
    String developerValue,
  ) {
    try {
      if (TValue != DateTime &&
          TValue != num &&
          TValue != int &&
          TValue != double &&
          TValue != String)
        throw new Exception(
            'field type must be a datetime, a number or a string');

      if (TValue == DateTime)
        return this._getDatetimeValue(formGroup, propertyName, developerValue)
            as TValue;

      if (TValue == num)
        return this._getNumberValue(formGroup, propertyName, developerValue)
            as TValue;

      if (TValue == String)
        return this._getStringValue(formGroup, propertyName, developerValue)
            as TValue;

      return null;
    } on RemotePropertyException catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  List<TValue> getRemoteValues<TValue>(
    FormGroupBase formGroup,
    String propertyName,
    List<String> developerValues,
  ) {
    try {
      if (TValue != DateTime &&
          TValue != num &&
          TValue != int &&
          TValue != double &&
          TValue != String)
        throw new Exception(
            'field type must be a datetime, a number or a string');

      if (TValue == DateTime)
        return this._getDatetimeValues(formGroup, propertyName, developerValues)
            as List<TValue>;

      if (TValue == num)
        return this._getNumberValues(formGroup, propertyName, developerValues)
            as List<TValue>;

      if (TValue == String)
        return this._getStringValues(formGroup, propertyName, developerValues)
            as List<TValue>;

      return null;
    } catch (e) {
      throw e;
    }
  }

  DateTime _getDatetimeValue(
    FormGroupBase formGroup,
    String propertyName,
    String developerValue,
  ) {
    // if the user did not provide a value, let return the developer one
    if (propertyName == null || propertyName.isEmpty) {
      return developerValue.toDateTime();
    }
    // else if the user provided a value, let return it
    else {
      // if current form group does not contain the property name, return the develop value
      if (!formGroup.containsControl(propertyName))
        return developerValue.toDateTime();
      // if targeted property is not a form control, throw an exception
      if (formGroup.controls[propertyName] is! FormControlBase)
        throw new Exception('Targeted property must be a form control');
      // else, get the value from form control, cast it as wanted type and return it
      FormControlBase formControl =
          formGroup.controls[propertyName] as FormControlBase;
      DateTime value = formControl.getValue() as DateTime;
      // if there is no value from user, so return the developer one, or null
      return value ?? developerValue.toDateTime() ?? null;
    }
  }

  num _getNumberValue(
    FormGroupBase formGroup,
    String propertyName,
    String developerValue,
  ) {
    // if the user did not provide a value, let return the developer one
    if (propertyName == null || propertyName.isEmpty) {
      return developerValue.toNumber();
    }
    // else if the user provided a value, let return it
    else {
      // if current form group does not contain the property name, return the develop value
      if (!formGroup.containsControl(propertyName))
        return developerValue.toNumber();
      // if targeted property is not a form control, throw an exception
      if (formGroup.controls[propertyName] is! FormControlBase)
        throw new Exception('Targeted property must be a form control');
      // else, get the value from form control, cast it as wanted type and return it
      FormControlBase formControl =
          formGroup.controls[propertyName] as FormControlBase;
      num value = formControl.getValue() as num;
      return value ?? developerValue.toNumber() ?? null;
    }
  }

  String _getStringValue(
    FormGroupBase formGroup,
    String propertyName,
    String developerValue,
  ) {
    // if the user did not provide a value, let return the developer one
    if (propertyName == null || propertyName.isEmpty) {
      return developerValue;
    }
    // else if the user provided a value, let return it
    else {
      // if current form group does not contain the property name, return the develop value
      if (!formGroup.containsControl(propertyName)) return developerValue;
      // if targeted property is not a form control, throw an exception
      if (formGroup.controls[propertyName] is! FormControlBase)
        throw new Exception('Targeted property must be a form control');
      // else, get the value from form control, cast it as wanted type and return it
      FormControlBase formControl =
          formGroup.controls[propertyName] as FormControlBase;
      String value = formControl.getValue() as String;
      return value ?? developerValue ?? null;
    }
  }

  List<DateTime> _getDatetimeValues(
    FormGroupBase formGroup,
    String propertyName,
    List<String> developerValues,
  ) {
    // if the user did not provide a value, let return the developer one
    if (propertyName == null || propertyName.isEmpty) {
      return developerValues.toDateTimeList();
    }
    // else if the user provided a value, let return it
    else {
      // if current form group does not contain the property name, return the develop value
      if (!formGroup.containsControl(propertyName)) {
        return developerValues.toDateTimeList();
      }
      // if targeted property is not a form control, throw an exception
      if (formGroup.controls[propertyName] is! FormControlBase)
        throw new Exception('Targeted property must be a form control');
      // else, get the value from form control, cast it as wanted type and return it
      FormControlBase formControl =
          formGroup.controls[propertyName] as FormControlBase;
      List<DateTime> value = formControl.getValue() as List<DateTime>;
      return value ?? developerValues.toDateTimeList() ?? null;
    }
  }

  List<num> _getNumberValues(
    FormGroupBase formGroup,
    String propertyName,
    List<String> developerValues,
  ) {
    // if the user did not provide a value, let return the developer one
    if (propertyName == null || propertyName.isEmpty) {
      return developerValues.toNumberList();
    }
    // else if the user provided a value, let return it
    else {
      // if current form group does not contain the property name, return the develop value
      if (!formGroup.containsControl(propertyName)) {
        return developerValues.toNumberList();
      }
      // if targeted property is not a form control, throw an exception
      if (formGroup.controls[propertyName] is! FormControlBase)
        throw new Exception('Targeted property must be a form control');
      // else, get the value from form control, cast it as wanted type and return it
      FormControlBase formControl =
          formGroup.controls[propertyName] as FormControlBase;
      List<num> value = formControl.getValue() as List<num>;
      return value ?? developerValues.toNumberList() ?? null;
    }
  }

  List<String> _getStringValues(
    FormGroupBase formGroup,
    String propertyName,
    List<String> developerValues,
  ) {
    // if the user did not provide a value, let return the developer one
    if (propertyName == null || propertyName.isEmpty) {
      return developerValues;
    }
    // else if the user provided a value, let return it
    else {
      // if current form group does not contain the property name, return the develop value
      if (!formGroup.containsControl(propertyName)) return developerValues;
      // if targeted property is not a form control, throw an exception
      if (formGroup.controls[propertyName] is! FormControlBase)
        throw new Exception('Targeted property must be a form control');
      // else, get the value from form control, cast it as wanted type and return it
      FormControlBase formControl =
          formGroup.controls[propertyName] as FormControlBase;
      List<String> value = formControl.getValue() as List<String>;
      return value ?? developerValues ?? null;
    }
  }
}
