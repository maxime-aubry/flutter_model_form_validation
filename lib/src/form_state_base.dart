import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/utils/index.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:queries/collections.dart';

enum EFormStatus {
  pure,
  valid,
  invalid,
}

class FormStateBase with PropertyChangeNotifier<String> {
  FormStateBase(
    this.formBuilder,
  ) {
    this.status = EFormStatus.pure;
    this.statuses = new Map<String, EAbstractControlStatus>();
    this.errors = new Map<String, ValidationError>();
  }

  @protected
  Map<String, EAbstractControlStatus> statuses;

  @protected
  Map<String, ValidationError> errors;

  @protected
  EFormStatus status;

  FormBuilderBase formBuilder;

  bool _actualizeModelState() {
    bool isValid = !Dictionary.fromMap(this.statuses)
        .where((arg1) =>
            arg1.value != null && arg1.value == EAbstractControlStatus.invalid)
        .any();
    this.status = isValid ? EFormStatus.valid : EFormStatus.invalid;
    return isValid;
  }

  void update(
    String listenerName,
    ValidationError error,
    EAbstractControlStatus status,
  ) {
    this.statuses[listenerName] = status;
    this.errors[listenerName] = error;
    this._actualizeModelState();
    super.notifyListeners('status');
  }
}
