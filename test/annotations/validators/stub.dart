import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

abstract class IStub<TAbstractControl extends AbstractControl,
    TValidator extends FormValidatorAnnotation> {
  TAbstractControl getControl();
  TValidator getValidator();
}
