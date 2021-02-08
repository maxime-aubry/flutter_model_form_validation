import 'dart:collection';

import 'package:flutter_model_form_validation/src/form/index.dart';

class FormIndexer extends MapBase<String, AbstractControl> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */
  Map<String, AbstractControl> _map = {};

  /* Getters */

  /* Setters */

  /* Constructors */

  /* Public methods */
  @override
  AbstractControl operator [](Object key) => this._map[key];

  @override
  void operator []=(String key, AbstractControl value) =>
      this._map[key] = value;

  @override
  void clear() => this._map.clear();

  @override
  Iterable<String> get keys => this._map.keys;

  @override
  AbstractControl remove(Object key) => this._map.remove(key);

  void addControl(AbstractControl control) =>
      this._map[control.uniqueName] = control;

  void removeControl(AbstractControl control) =>
      this.remove(control.uniqueName);

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

  /* Protected methods */

  /* Private methods */
}
