import 'dart:collection';

import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:queries/collections.dart';

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

  FormGroup getFormGroupByFormPath(String formPath) =>
      this._getControlByFormPath<FormGroup>(formPath);

  FormArray getFormArrayByFormPath(String formPath) =>
      this._getControlByFormPath<FormArray>(formPath);

  FormControl<TProperty> getFormControlByFormPath<TProperty>(String formPath) =>
      this._getControlByFormPath<FormControl<TProperty>>(formPath);

  /* Protected methods */

  /* Private methods */
  TAbstractControl
      _getControlByFormPath<TAbstractControl extends AbstractControl>(
          String formPath) {
    TAbstractControl currentClone = Collection(this.values.toList())
        .where((arg1) => arg1 is TAbstractControl)
        .select((arg1) => arg1 as TAbstractControl)
        .where((arg1) => arg1.formPath == formPath)
        .singleOrDefault();

    if (currentClone == null) throw new Exception('Cannot get current clone.');

    return currentClone;
  }
}
