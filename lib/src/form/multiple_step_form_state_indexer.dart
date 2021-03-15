import 'dart:collection';

import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class MultipleStepFormStateIndexer extends MapBase<String, ReactiveFormState> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */
  Map<String, ReactiveFormState> _map = {};

  /* Getters */

  /* Setters */

  /* Constructors */

  /* Public methods */
  @override
  ReactiveFormState operator [](Object key) => this._map[key];

  @override
  void operator []=(String key, ReactiveFormState value) =>
      this._map[key] = value;

  @override
  void clear() => this._map.clear();

  @override
  Iterable<String> get keys => this._map.keys;

  @override
  ReactiveFormState remove(Object key) => this._map.remove(key);

  void addFormState(String step, ReactiveFormState formState) =>
      this._map[step] = formState;

  void removeFormState(String step) => this.remove(step);

  ReactiveFormState getFormState(String step) {
    if (step == null || step.isEmpty)
      throw new MultipleStepFormStateIndexerException(
        'Step name is not provided.',
      );

    if (!this.containsKey(step))
      throw new MultipleStepFormStateIndexerException(
        'Step name is not registered.',
      );

    ReactiveFormState formState = this._map[step];
    return formState;
  }

  /* Protected methods */

  /* Private methods */
}
