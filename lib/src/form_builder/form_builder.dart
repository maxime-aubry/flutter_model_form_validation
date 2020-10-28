import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_group.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

class FormBuilder<TModel extends PropertyChangeNotifier<String>> {
  FormBuilder(ModelState<TModel> modelState) : assert(modelState != null) {
    this._modelState = modelState;
    if (modelState != null) this._init();
  }

  // private properties
  ModelState<TModel> _modelState;

  // public properties
  FormGroup group;

  // methods
  void _init() {
    this.group = new FormGroup(
      this._modelState,
      this._modelState.model,
      null,
      null,
    );
  }
}
