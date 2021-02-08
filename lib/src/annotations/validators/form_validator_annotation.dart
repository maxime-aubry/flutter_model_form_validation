import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

/// [FormValidatorAnnotation] is the parent class for every validators you will create and use.
/// {@category Metadata}
/// {@subCategory FormDeclarators}
abstract class FormValidatorAnnotation<
    TAbstractControl extends AbstractControl> {
  const FormValidatorAnnotation({
    @required this.error,
  });

  /// This is the error to display (provided by developers).
  final String error;

  /// Verify if the model is valid compared to the current validator You must add [value] parameter, this one is your current property to validate.
  /// [model] parameter is also required, even if your custom validator won't use it.
  /// It reprensents your full object model with all values.
  /// Maybe you would validate a property in comparison to others.
  Future<bool> isValid(
    TAbstractControl control,
    String property,
  );
}
