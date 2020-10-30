import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class DynamicFormArray extends FormArray with DynamicFormValidator {
  DynamicFormArray(
    String name,
    DynamicFormGroup parentGroup,
  ) : super(name, parentGroup);
}
