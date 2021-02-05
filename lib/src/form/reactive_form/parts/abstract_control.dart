import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class AbstractControl extends ChangeNotifier {
  /* Public properties */
  FormGroup parentGroup;
  String name;
  EAbstractControlStatus status;
  ValidationError error;
  bool isInitialized;
  FormIndexer indexer;

  /* Protected properties */
  @protected
  List<FormValidatorAnnotation> validators;

  @protected
  ReactiveFormState formState;

  /* Private properties */

  /* Getters */
  String get uniqueName {
    if (this.name == 'root' && this.parentGroup == null) return this.name;
    return '${this.parentGroup.hashCode}.${this.name}';
  }

  /* Setters */

  /* Constructors */
  AbstractControl(
    List<FormValidatorAnnotation> validators,
    ReactiveFormState formState,
  ) {
    if (formState == null)
      throw new Exception(
          'Cannot initialize abstract control if form state is not provided.');

    this.name = null;
    this.parentGroup = null;
    this.validators = validators ?? [];
    this.formState = formState;
    this.status = EAbstractControlStatus.pure;
    this.isInitialized = false;
  }

  /* Public methods */
  // @protected
  // ReactiveFormBuilder getFormBuilder() {
  //   FormGroup firstFormGroup;

  //   if (this.parentGroup != null) {
  //     firstFormGroup = this._getParentGroup(this.parentGroup);
  //   } else if (this is FormGroup &&
  //       this.name == 'root' &&
  //       this.parentGroup == null) {
  //     firstFormGroup = this;
  //   }

  //   if (firstFormGroup == null)
  //     throw new Exception('Cannot get first form group.');

  //   if (firstFormGroup.formBuilder == null)
  //     throw new Exception('Form builder is not located.');

  //   return firstFormGroup.formBuilder;
  // }

  /* Protected methods */
  @protected
  void index() => this.indexer[this.uniqueName] = this;

  @protected
  Future<void> validateControl(
    String formPath,
    String modelPath,
  ) async {
    bool isValid = true;
    this.error = null;

    if (this.validators == null || this.validators.isEmpty) {
      this.status = EAbstractControlStatus.valid;
      this.formState.update();
      return;
    }

    // before validation
    this.status = EAbstractControlStatus.validationInProgress;
    this.formState.update();
    super.notifyListeners();

    // validation
    for (FormValidatorAnnotation validator in this.validators) {
      try {
        isValid = await validator.isValid(
          this._getRoot(this),
          parentGroup,
          this.name,
        );

        if (!isValid) {
          this.error = ValidationError(
            name,
            validator.runtimeType,
            validator.error,
          );
          break;
        }
      } on TypeError catch (_) {
        isValid = false;
      } on ValidationException catch (_) {
        isValid = false;
      }
    }

    // after validation
    this.status =
        isValid ? EAbstractControlStatus.valid : EAbstractControlStatus.invalid;
    this.formState.update();
    super.notifyListeners();
  }

  /* Private methods */
  FormGroup _getRoot(
    AbstractControl control,
  ) {
    if (control.parentGroup != null) return this._getRoot(control.parentGroup);

    if (control is! FormGroup)
      throw new Exception(
          'Cannot return a form control that is not a form group.');

    return control;
  }
}
