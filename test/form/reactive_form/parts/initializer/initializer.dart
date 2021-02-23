import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

void initializeFormGroup(
  FormGroup formGroup,
  String name,
  FormGroup parent,
  bool isArrayItem,
) {
  formGroup.name = name;
  formGroup.parentGroup = parent;
  formGroup.isArrayItem = isArrayItem;
  formGroup.isInitialized = true;
}

void initializeFormArray(
  FormArray formArray,
  String name,
  FormGroup parent,
) {
  formArray.name = name;
  formArray.parentGroup = parent;
  formArray.isInitialized = true;
}

void initializeFormControl(
  FormControl formControl,
  String name,
  FormGroup parent,
) {
  formControl.name = name;
  formControl.parentGroup = parent;
  formControl.isInitialized = true;
}
