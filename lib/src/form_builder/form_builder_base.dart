import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class FormBuilderBase<TModel extends ModelForm> {
  FormBuilderBase(this.group);

  // public properties
  FormGroupBase group;
}
