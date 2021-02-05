// import 'dart:collection';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

abstract class FormIndexer implements Map<String, AbstractControl> {
  external factory FormIndexer();
  
  external factory FormIndexer.identity();

  FormGroup ofFormGroup(String key) {
    // HashMap
    if (!this.containsKey(key))
      throw new Exception(
          'Cannot get abstract control. Property $key not found.');

    if (this[key] is! FormGroup)
      throw new Exception(
          'Cannot get abstract control named $key with FormGroup type.');

    FormGroup formGroup = this[key];
    return formGroup;
  }

  FormArray ofFormArray(String key) {
    if (!this.containsKey(key))
      throw new Exception(
          'Cannot get abstract control. Property $key not found.');

    if (this[key] is! FormArray)
      throw new Exception(
          'Cannot get abstract control named $key with FormArray type.');

    FormArray formArray = this[key];
    return formArray;
  }

  FormControl<TProperty> ofFormControl<TProperty>(String key) {
    if (!this.containsKey(key))
      throw new Exception(
          'Cannot get abstract control. Property $key not found.');

    if (this[key] is! FormControl<TProperty>)
      throw new Exception(
          'Cannot get abstract control named $key with FormControl<TProperty> type.');

    FormControl<TProperty> formControl = this[key];
    return formControl;
  }
}
