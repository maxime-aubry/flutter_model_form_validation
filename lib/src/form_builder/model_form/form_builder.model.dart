import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/correspondence_handler.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class ModelFormBuilder extends FormBuilder {
  ModelFormBuilder() : super.modelFormBuilder() {
    this._isInitialized = false;
    this._isAttachedToFormState = false;
    this._correspondenceHandler = new ModelCorrespondenceHandler();
  }

  bool _isInitialized;
  bool _isAttachedToFormState;
  ModelCorrespondenceHandler _correspondenceHandler;

  bool get isInitialized => this._isInitialized;
  bool get isAttachedToFormState => this._isAttachedToFormState;

  @override
  void initialize(FormStateBase formState) {
    assert(formState != null,
        'Cannot initialize form builder if form state is not provided.');
    assert(formState is ModelFormState,
        'Cannot initialize form builder with a non-model form state.');
    assert(!this._isInitialized,
        'Cannot initialize form builder if this one is already initialized.');
    assert(!this._isAttachedToFormState,
        'Cannot attach form builder to form styate if this one is already attached.');

    ModelFormState modelFormState = formState as ModelFormState;
    super.formState = modelFormState;

    this.group = new ModelFormGroup(
      name: 'root',
      parentGroup: null,
      current: modelFormState.model,
      isArrayItem: false,
      formBuilder: this,
    );

    this._isInitialized = true;
    this._isAttachedToFormState = true;
  }

  void addCorrespondence(String fpFullname, AbstractControl abstractControl) =>
      this._correspondenceHandler.add(fpFullname, abstractControl);

  void removeCorrespondence(String fpFullname) =>
      this._correspondenceHandler.remove(fpFullname);

  T getFormElement<T extends AbstractControl>(
    ModelForm model,
    String property,
  ) =>
      this._correspondenceHandler.getFormElement<T>(
            model,
            property,
          );
}
