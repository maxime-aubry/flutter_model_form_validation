import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class ModelFormState extends FormStateBase {
  ModelFormState(ModelForm model) : super.modelFormState() {
    this.model = model;
    this._initialize();
  }

  ModelForm model;

  ModelFormBuilder get formBuilder {
    return super.formBuilder as ModelFormBuilder;
  }

  void _initialize() {
    super.formBuilder = new ModelFormBuilder();
    super.formBuilder.initialize(this);
  }
}
