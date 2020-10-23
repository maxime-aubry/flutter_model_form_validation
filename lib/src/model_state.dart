import 'package:flutter_model_form_validation/src/annotations/validation_error.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_builder.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

enum FormStatus {
  pure,
  valid,
  invalid,
  validationInProgress,
  submissionInProgress,
  submissionSuccess,
  submissionFailure,
}

class ModelState<TModel extends PropertyChangeNotifier<String>> {
  ModelState(TModel model) : assert(model != null) {
    this.model = model;
    this._init();
  }

  TModel model;
  FormBuilder _formBuilder;
  FormStatus _status;
  Map<String, ValidationError> get errors => null;

  void _init() {
    this._formBuilder = new FormBuilder<TModel>(this);
  }

  // Future<bool> validateForm() async {
  //   try {
  //     this._status = FormStatus.validationInProgress;

  //     // validate each property
  //     for (FormProperty property in this._properties)
  //       await property.update(this.model);

  //     // validate the form
  //     bool isValid = !Collection(this._properties)
  //         .any((arg1) => arg1.status == InputStatus.invalid);
  //     this._status = isValid ? FormStatus.valid : FormStatus.invalid;
  //     return isValid;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }
}
