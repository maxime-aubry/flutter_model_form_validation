import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_group.dart';

class FormBuilder<TModel> {
  FormBuilder(TModel model) : assert(model != null) {
    this._init(model);
  }

  // properties
  FormGroup group;

  // methods
  void _init(TModel model) {
    this.group = new FormGroup(model as Object, model as Object, null);
  }
}
