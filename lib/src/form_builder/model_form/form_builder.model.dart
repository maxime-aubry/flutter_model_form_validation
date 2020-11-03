import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/model_form/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class ModelFormBuilder<TModel extends ModelForm> extends FormBuilderBase {
  ModelFormBuilder(ModelFormState<TModel> modelState)
      : assert(modelState != null),
        super(null) {
    this._formState = modelState;
    if (modelState != null) this._initialize();
  }

  // private properties
  ModelFormState<TModel> _formState;

  // private methods
  void _initialize() {
    this.group = new ModelFormGroup(
      this._formState,
      this._formState.model,
      'root',
      null,
    );
  }
}
