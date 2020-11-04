import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class ModelFormBuilder<TModel extends ModelForm> extends FormBuilderBase {
  ModelFormBuilder() : super(null) {
    this._isInitialized = false;
    this._isAttachedToFormState = false;
  }

  // private properties
  ModelFormState<TModel> _formState;
  bool _isInitialized;
  bool _isAttachedToFormState;

  // private methods
  void initialize(ModelFormState<TModel> formState) {
    assert(formState != null, 'Form state must be provided.');
    assert(this._isInitialized == false,
        'Form builder must not be initialized when calling initialize method.');
    assert(this._isAttachedToFormState == false,
        'Form builder must not be attached when calling initialize method.');
    assert(this._formState == null,
        'Form state must not be null when calling initialize method.');

    this._formState = formState;

    this.group = new ModelFormGroup(
      this._formState,
      this._formState.model,
      'root',
      null,
    );

    this._isInitialized = true;
    this._isAttachedToFormState = true;
  }
}
