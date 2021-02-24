import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

void initializeFormGroup(
  FormGroup formGroup,
  String name,
  FormGroup parent,
  bool isArrayItem,
) {
  formGroup.name = name;
  formGroup.parent = parent;
  formGroup.isArrayItem = isArrayItem;
  formGroup.isInitialized = true;
}

void initializeFormArray(
  FormArray formArray,
  String name,
  FormGroup parent,
) {
  formArray.name = name;
  formArray.parent = parent;
  formArray.isInitialized = true;
}

void initializeFormControl(
  FormControl formControl,
  String name,
  FormGroup parent,
) {
  formControl.name = name;
  formControl.parent = parent;
  formControl.isInitialized = true;
}
