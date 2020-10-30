import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class FormBuilder extends FormBuilderBase {
  FormBuilder({
    @required FormGroup group,
  }) : super(group);

  // private properties
  FormStateBase _formState;
}
