import 'package:flutter_model_form_validation/src/form_builder/dynamic_form/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/index.dart';

class DynamicFormControl extends FormControl with DynamicFormValidator {
  DynamicFormControl(
    Object value,
    String name,
    FormGroup parentGroup,
  ) : super(value, name, parentGroup);
}
