import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/model_form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class ModelFormState extends ReactiveFormState {
  /* Public properties */
  ModelForm model;

  /* Protected properties */

  /* Private properties */

  /* Getters */
  ModelFormBuilder get formBuilder => super.formBuilder as ModelFormBuilder;

  /* Setters */

  /* Constructors */
  ModelFormState({
    @required ModelForm model,
  }) : super(formBuilder: null) {
    this.model = model;
  }

  /* Public methods */
  @override
  void initialize() {
    if (this.isInitialized)
      throw new Exception(
          'Cannot initialize an already initialized form state.');

    if (!LibraryInitializer.isInitialized)
      throw new Exception(
          'flutter_model_form_validation library is not initialized. Please, call LibraryInitializer.initialize(String libraryName) method.');

    super.formBuilder = new ModelFormBuilder();
    super.formBuilder.initialize(this);
    this.isInitialized = true;
  }

  /* Protected methods */

  /* Private methods */
}
