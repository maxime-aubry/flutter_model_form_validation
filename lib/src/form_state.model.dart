import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class ModelFormState<TModel extends ModelForm> extends FormStateBase {
  ModelFormState(TModel model) : super.modelFormState() {
    this.model = model;
    this._initialize();
  }

  TModel model;

  void _initialize() {
    super.formBuilder = new ModelFormBuilder<TModel>();
    super.formBuilder.initialize(this);
  }
}
