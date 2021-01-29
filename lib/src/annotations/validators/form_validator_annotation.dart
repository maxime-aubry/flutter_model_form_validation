import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';
// import 'package:queries/collections.dart';

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
    FormGroup fg,
    Object value,
    String formPath,
    String modelFormPath,
  );

  TValue getRemoteValue<TValue>(
    FormGroup formGroup,
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
    FormGroup formGroup,
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
    FormGroup formGroup,
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
      if (formGroup.controls[propertyName] is! FormControl)
        throw new Exception('Targeted property must be a form control');
      // else, get the value from form control, cast it as wanted type and return it
      FormControl formControl = formGroup.controls[propertyName] as FormControl;
      DateTime value = formControl.value as DateTime;
      // if there is no value from user, so return the developer one, or null
      return value ?? developerValue.toDateTime() ?? null;
    }
  }

  num _getNumberValue(
    FormGroup formGroup,
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
      if (formGroup.controls[propertyName] is! FormControl)
        throw new Exception('Targeted property must be a form control');
      // else, get the value from form control, cast it as wanted type and return it
      FormControl formControl = formGroup.controls[propertyName] as FormControl;
      num value = formControl.value as num;
      return value ?? developerValue.toNumber() ?? null;
    }
  }

  String _getStringValue(
    FormGroup formGroup,
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
      if (formGroup.controls[propertyName] is! FormControl)
        throw new Exception('Targeted property must be a form control');
      // else, get the value from form control, cast it as wanted type and return it
      FormControl formControl = formGroup.controls[propertyName] as FormControl;
      String value = formControl.value as String;
      return value ?? developerValue ?? null;
    }
  }

  List<DateTime> _getDatetimeValues(
    FormGroup formGroup,
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
      if (formGroup.controls[propertyName] is! FormControl)
        throw new Exception('Targeted property must be a form control');
      // else, get the value from form control, cast it as wanted type and return it
      FormControl formControl = formGroup.controls[propertyName] as FormControl;
      List<DateTime> value = formControl.value as List<DateTime>;
      return value ?? developerValues.toDateTimeList() ?? null;
    }
  }

  List<num> _getNumberValues(
    FormGroup formGroup,
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
      if (formGroup.controls[propertyName] is! FormControl)
        throw new Exception('Targeted property must be a form control');
      // else, get the value from form control, cast it as wanted type and return it
      FormControl formControl = formGroup.controls[propertyName] as FormControl;
      List<num> value = formControl.value as List<num>;
      return value ?? developerValues.toNumberList() ?? null;
    }
  }

  List<String> _getStringValues(
    FormGroup formGroup,
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
      if (formGroup.controls[propertyName] is! FormControl)
        throw new Exception('Targeted property must be a form control');
      // else, get the value from form control, cast it as wanted type and return it
      FormControl formControl = formGroup.controls[propertyName] as FormControl;
      List<String> value = formControl.value as List<String>;
      return value ?? developerValues ?? null;
    }
  }
}

// extension FormValidatorAnnotationParsing on List<FormValidatorAnnotation> {
//   List<FormValidatorAnnotation> reorder() {
//     List<FormValidatorAnnotation> validators =
//         Collection(this).orderBy((arg1) => arg1.criticityLevel).toList();
//     return validators;
//   }
// }
