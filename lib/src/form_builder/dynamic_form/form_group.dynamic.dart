import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class DynamicFormGroup extends FormGroup with DynamicFormValidator {
  DynamicFormGroup(
    String name,
    FormGroup parentGroup,
  ) : super(name, parentGroup);
}
