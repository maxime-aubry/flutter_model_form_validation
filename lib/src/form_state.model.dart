import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class ModelFormState extends FormStateBase {
  ModelFormState({
    @required ModelForm model,
    bool isMultipleStepsForm = false,
  }) : super(formBuilder: null, isMultipleStepsForm: isMultipleStepsForm) {
    this.model = model;
    // this._initialize();
  }

  ModelForm model;

  ModelFormBuilder get formBuilder {
    return super.formBuilder as ModelFormBuilder;
  }

  @override
  void initialize() {
    super.formBuilder = new ModelFormBuilder();
    super.formBuilder.initialize(this);
  }
}
