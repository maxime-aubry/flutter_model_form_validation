import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class DynamicFormBuilder extends FormBuilder with DynamicFormValidator {
  DynamicFormBuilder(FormState formState) : super() {
    this._formState = formState;
  }

  // private properties
  FormState _formState;
}
