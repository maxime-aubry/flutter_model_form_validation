import 'package:flutter_model_form_validation/src/form/form_control_filter/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:flutter_model_form_validation/src/form/model_form/index.dart';

class FormControlElement<TProperty> extends FormElementNotifier<TProperty>
    with FormControlFilter<TProperty> {
  FormControlElement(TProperty value) : super(value) {
    // // check if TProperty is an allowed type
    // // throw an exception if not
    super.checkAllowedFormControlType();
  }

  TProperty get value => super.value;

  @override
  set value(TProperty value) {
    super.value = value;
  }
}
