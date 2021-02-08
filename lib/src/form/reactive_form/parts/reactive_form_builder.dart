import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form/form_indexer.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class ReactiveFormBuilder {
  /* Public properties */
  bool isInitialized;
  FormGroup group;
  ReactiveFormState formState;
  FormIndexer indexer;

  /* Protected properties */

  /* Private properties */
  // bool _isMultipleStepsForm;

  /* Getters */
  // bool get isMultipleStepsForm => this._isMultipleStepsForm;

  /* Setters */

  /* Constructors */
  ReactiveFormBuilder({
    @required this.group,
    bool isMultipleStepsForm = false,
  }) {
    this.isInitialized = false;
    this.indexer = new FormIndexer();
    // this._isMultipleStepsForm = isMultipleStepsForm;
  }

  /* Public methods */
  void initialize(ReactiveFormState formState) {
    if (formState == null)
      throw new Exception(
          'Cannot initialize ReactiveFormBuilder if ReactiveFormState is not provided.');

    this.formState = formState;
    this.group.initialize('root', null, false, this.formState);
    // if (this._isMultipleStepsForm) this.checkMultipleStepsForm();
    this.isInitialized = true;
  }

  /// If current form is multiple steps form, check if root level contains only form groups.
  /// If it does not, throw an exception.
  @protected
  void checkMultipleStepsForm() {
    bool isValidMultipleStepsForm = !this
        .group
        .controls
        .entries
        .toList()
        .any((element) => element.value is! FormGroup);

    if (!isValidMultipleStepsForm)
      throw new Exception(
          'A form with multipe steps must contains form groups only into its root level.');
  }

  /* Protected methods */

  /* Private methods */
}
