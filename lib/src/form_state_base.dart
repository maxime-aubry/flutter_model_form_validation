import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';
import 'package:queries/collections.dart';

enum EFormStatus {
  pure,
  valid,
  invalid,
}

class FormStateBase {
  FormStateBase(
    this.formBuilder,
  ) {
    this.status = EFormStatus.pure;
    this._formControlStates = new Map<String, AbstractControlState>();
  }

  // private properties
  Map<String, AbstractControlState> _formControlStates;

  // public properties
  EFormStatus status;
  FormBuilderBase formBuilder;

  // private methods
  bool _actualizeModelState() {
    bool isValid = !Dictionary.fromMap(this._formControlStates)
        .where((arg1) =>
            arg1.value != null &&
            arg1.value.status == EAbstractControlStatus.invalid)
        .any();
    this.status = isValid ? EFormStatus.valid : EFormStatus.invalid;
    return isValid;
  }

  // public methods
  void actualizeAbstractControlState(
    String key,
    ValidationError error,
    EAbstractControlStatus status,
  ) {
    print('Actualizing form element "$key" with status "$status".');

    this._formControlStates[key] = new AbstractControlState(
      key,
      error,
      status,
    );
    this._actualizeModelState();
  }
}
