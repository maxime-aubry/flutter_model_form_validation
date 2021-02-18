import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class NavigatorTester with FormValidatorNavigator {}

class FormAnnotationStub {
  FormControl<String> control;
  NavigatorTester navigator;
}

class ValidatorStub<TAbstractControl extends AbstractControl,
    TValidator extends FormValidatorAnnotation> {
  TAbstractControl control;
  TValidator validator;
}

/* Value is valid */
/* Value is not valid */
/* Remote parameters are provided */
/* Exceptions on parameters */
