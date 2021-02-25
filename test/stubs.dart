import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class NavigatorTester with FormValidatorNavigator {}

class FormAnnotationStub {
  String targetName;
  FormControl<String> control;
  NavigatorTester navigator;
}

class ValidatorStub<TAbstractControl extends AbstractControl,
    TValidator extends FormValidatorAnnotation> {
  TAbstractControl control;
  TValidator validator;
}

/*class AbstractControlStub<TAbstractControl extends AbstractControl> {
  TAbstractControl control;
}*/

class FormBuilderStub<TFormBuilder extends ReactiveFormBuilder,
    TFormState extends ReactiveFormState> {
  TFormBuilder formBuilder;
  TFormState formState;
}

/* Value is valid */
/* Value is not valid */
/* Remote parameters are provided */
/* Exceptions */
