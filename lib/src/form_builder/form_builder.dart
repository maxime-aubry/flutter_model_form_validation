import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class FormBuilder<TModel extends ModelForm> {
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
