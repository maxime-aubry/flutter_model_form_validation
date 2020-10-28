import 'package:flutter_model_form_validation/src/annotations/validators/validation_error.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:queries/collections.dart';

enum EFormStatus {
  pure,
  valid,
  invalid,
}

class ModelState<TModel extends PropertyChangeNotifier<String>>
    with PropertyChangeNotifier<String> {
  ModelState(TModel model) : assert(model != null) {
    this.model = model;
    this.status = EFormStatus.pure;
    this.formControlStates = new Map<String, AbstractControlState>();
    this._init();
  }

  // private properties
  FormBuilder formBuilder;

  // public properties
  TModel model;
  EFormStatus status;
  Map<String, AbstractControlState> formControlStates;

  // private methods
  void _init() {
    this.formBuilder = new FormBuilder<TModel>(this);
  }

  void actualizeAbstractControlState(
    String key,
    ValidationError error,
    EAbstractControlStatus status,
  ) {
    this.formControlStates[key] = new AbstractControlState(
      key,
      error,
      status,
    );
    this._actualizeModelState();
    this.notifyListeners('formControlStates');
    this.notifyListeners('status');
  }

  static String getListenerName(Object value, String propertyName) =>
      '${value.hashCode}.$propertyName';

  Future<bool> validateForm() async {
    for (MapEntry<String, AbstractControl> control
        in this.formBuilder.group.controls.entries) {
      if (control.value is FormGroup) this._validateFormGroup(control.value);
      if (control.value is FormArray) this._validateFormArray(control.value);
      if (control.value is FormControl)
        this._validateFormControl(control.value);
    }

    return this.status == EFormStatus.valid;
  }

  Future _validateFormGroup(FormGroup formGroup) async {
    await formGroup.validate(
      formGroup.modelState,
      formGroup.name,
      formGroup.current,
    );

    for (MapEntry<String, AbstractControl> control
        in formGroup.controls.entries) {
      if (control.value is FormGroup) this._validateFormGroup(control.value);
      if (control.value is FormArray) this._validateFormArray(control.value);
      if (control.value is FormControl)
        this._validateFormControl(control.value);
    }
  }

  Future _validateFormArray(FormArray formArray) async {
    await formArray.validate(
      formArray.modelState,
      formArray.name,
      formArray.items,
    );

    for (FormGroup formGroup in formArray.groups) _validateFormGroup(formGroup);
  }

  Future _validateFormControl(FormControl formControl) async {
    await formControl.validate(
      formControl.modelState,
      formControl.name,
      formControl.value,
    );
  }

  bool _actualizeModelState() {
    bool isValid = !Dictionary.fromMap(this.formControlStates)
        .where((arg1) =>
            arg1.value != null &&
            arg1.value.status == EAbstractControlStatus.invalid)
        .any();
    this.status = isValid ? EFormStatus.valid : EFormStatus.invalid;
    return isValid;
  }
}
