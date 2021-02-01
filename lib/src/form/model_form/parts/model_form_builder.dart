import 'package:flutter_model_form_validation/src/form/model_form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class ModelFormBuilder extends ReactiveFormBuilder {
  ModelFormBuilder() : super(group: null) {
    // this._isInitialized = false;
    // this._isAttachedToFormState = false;
    // this._correspondenceHandler = new ModelCorrespondenceHandler();
  }

  // bool _isInitialized;
  // bool _isAttachedToFormState;
  // ModelCorrespondenceHandler _correspondenceHandler;

  // bool get isInitialized => this._isInitialized;
  // bool get isAttachedToFormState => this._isAttachedToFormState;

  @override
  void initialize(ReactiveFormState formState) {
    assert(formState != null,
        'Cannot initialize form builder if form state is not provided.');
    assert(formState is ModelFormState,
        'Cannot initialize form builder with a non-model form state.');
    // assert(!this.isInitialized,
    //     'Cannot initialize form builder if this one is already initialized.');
    // assert(!this.isAttachedToFormState,
    //     'Cannot attach form builder to form styate if this one is already attached.');

    ModelFormState modelFormState = formState as ModelFormState;
    super.formState = modelFormState;

    this.group = new ModelFormGroup(
      name: 'root',
      parentGroup: null,
      current: modelFormState.model,
      isArrayItem: false,
      formBuilder: this,
    );

    super.checkMultipleStepsForm();
    // this.isInitialized = true;
    // this.isAttachedToFormState = true;
  }

  // void addCorrespondence(String fpFullname, AbstractControl abstractControl) =>
  //     this._correspondenceHandler.add(fpFullname, abstractControl);

  // void removeCorrespondence(String fpFullname) =>
  //     this._correspondenceHandler.remove(fpFullname);

  // T getFormElement<T extends AbstractControl>(
  //   ModelForm model,
  //   String property,
  // ) =>
  //     this._correspondenceHandler.getFormElement<T>(
  //           model,
  //           property,
  //         );

  T getFormElement<T extends AbstractControl>(
    ModelForm model,
    String property,
  ) =>
      null;
}
