import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class ModelFormBuilder<TModel extends ModelForm> extends FormBuilder {
  ModelFormBuilder() : super.modelFormBuilder() {
    this._isInitialized = false;
    this._isAttachedToFormState = false;
  }

  bool _isInitialized;
  bool _isAttachedToFormState;
  bool get isInitialized => this._isInitialized;
  bool get isAttachedToFormState => this._isAttachedToFormState;

  @override
  void initialize(FormStateBase formState) {
    assert(formState != null,
        'Cannot initialize form builder if form state is not provided.');
    assert(formState is ModelFormState<TModel>,
        'Cannot initialize form builder with a non-model form state.');
    assert(!this._isInitialized,
        'Cannot initialize form builder if this one is already initialized.');
    assert(!this._isAttachedToFormState,
        'Cannot attach form builder to form styate if this one is already attached.');

    ModelFormState<TModel> modelFormState = formState as ModelFormState<TModel>;
    super.formState = modelFormState;

    this.group = new ModelFormGroup(
      'root',
      null,
      modelFormState.model,
      false,
      this,
    );

    this._isInitialized = true;
    this._isAttachedToFormState = true;
  }
}
