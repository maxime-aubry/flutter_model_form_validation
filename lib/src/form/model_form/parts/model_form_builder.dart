import 'package:flutter_model_form_validation/src/form/model_form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class ModelFormBuilder extends ReactiveFormBuilder {
  /* Public properties */
  bool isInitialized;

  /* Protected properties */

  /* Private properties */
  // bool _isMultipleStepsForm;

  /* Getters */
  @override
  ModelFormState get formState => super.formState as ModelFormState;

  /* Setters */

  /* Constructors */
  ModelFormBuilder() : super(group: null) {
    this.isInitialized = false;
  }

  /* Public methods */
  @override
  void initialize(ReactiveFormState formState) {
    if (formState == null)
      throw new Exception(
          'Cannot initialize form builder if form state is not provided.');

    if (formState is! ModelFormState)
      throw new Exception(
          'Cannot initialize form builder with a non-model form state.');

    this.formState = formState as ModelFormState;
    this._addMainFormGroup();
  }

  /* Protected methods */

  /* Private methods */
  void _addMainFormGroup() {
    ModelFormGroup group = new ModelFormGroup(
      formBuilder: this,
      formState: this.formState,
    );
    group.initialize('root', null, false, this.indexer);
    this.group = group;
  }

  // void addCorrespondence(String fpuniqueName, AbstractControl abstractControl) =>
  //     this._correspondenceHandler.add(fpuniqueName, abstractControl);

  // void removeCorrespondence(String fpuniqueName) =>
  //     this._correspondenceHandler.remove(fpuniqueName);

  // T getFormElement<T extends AbstractControl>(
  //   ModelForm model,
  //   String property,
  // ) =>
  //     this._correspondenceHandler.getFormElement<T>(
  //           model,
  //           property,
  //         );

  // T getFormElement<T extends AbstractControl>(
  //   ModelForm model,
  //   String property,
  // ) =>
  //     null;
}
