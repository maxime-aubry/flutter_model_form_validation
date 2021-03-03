import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';
import 'package:queries/collections.dart';

class AbstractControl extends ChangeNotifier {
  /* Public properties */
  FormGroup parent;
  String name;
  EAbstractControlStatus status;
  ValidationError error;
  bool isInitialized;

  /* Protected properties */
  @protected
  List<FormValidatorAnnotation> validators;

  @protected
  ReactiveFormState formState;

  /* Private properties */

  /* Getters */
  String get uniqueName => '${this.hashCode}.${this.name}';

  ReactiveFormBuilder get formBuilder => this.formState.formBuilder;

  FormGroup get root => this._getRoot();

  /* Setters */

  /* Constructors */
  AbstractControl(List<FormValidatorAnnotation> validators) {
    this.name = null;
    this.parent = null;
    this.validators = validators ?? [];
    this.status = EAbstractControlStatus.pure;
    this.isInitialized = false;
  }

  /* Public methods */
  void index() => this.formState.formBuilder.indexer.addControl(this);

  void deindex() => this.formState.formBuilder.indexer.removeControl(this);

  TValidator getValidator<TValidator extends FormValidatorAnnotation>() {
    TValidator validator = Collection(this.validators)
        .where((arg1) => arg1 is TValidator)
        .singleOrDefault();

    if (validator == null)
      throw new FormBuilderException(
          'Current ${this.runtimeType} has no validator of ${TValidator.toString()} type.');

    return validator;
  }

  /* Protected methods */
  @protected
  Future<void> validateControl() async {
    bool isValid = true;
    this.error = null;

    if (this.validators == null || this.validators.isEmpty) {
      this.status = EAbstractControlStatus.valid;
      this.formState.update();
      super.notifyListeners();
      return;
    }

    // before validation
    this.status = EAbstractControlStatus.validationInProgress;
    this.formState.update();
    super.notifyListeners();

    // validation
    for (FormValidatorAnnotation validator in this.validators) {
      try {
        isValid = await validator.isValid(this);

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
      } on Exception catch (_) {
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
  FormGroup _getRoot() {
    // if current control is root, return it.
    if (this is FormGroup && this.parent == null && this.name == 'root')
      return this;

    // if it's not root but there is not parent.
    if (this.parent == null)
      throw new FormBuilderException(
          'Current ${this.runtimeType} has no parent.');

    return this.parent._getRoot();
  }
}
