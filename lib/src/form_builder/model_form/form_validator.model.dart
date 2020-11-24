import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';
import 'package:queries/collections.dart';
import 'package:reflectable/reflectable.dart';

mixin ModelFormValidator<TModel extends ModelForm> {
  @protected
  InstanceMirror getInstanceMirror(Object value) {
    InstanceMirror instanceMirror = flutterModelFormValidator.reflect(value);
    return instanceMirror;
  }

  @protected
  TFormElement getModelPart<TFormElement extends FormElementNotifier>(
    ModelForm model,
    String property,
  ) {
    assert(
        TFormElement == FormGroupElement ||
            TFormElement == FormArrayElement ||
            TFormElement == FormControlElement,
        'Cannot get a model part that is not an object of type FormGroupElement, FormArrayElement, FormControlElement or FormControllistElement.');

    InstanceMirror instanceMirror = this.getInstanceMirror(model);
    Object formElement = instanceMirror.invokeGetter(property);
    if (formElement is! TFormElement)
      throw new Exception('Cannot get a model part of $TFormElement type.');
    return formElement as TFormElement;
  }

  @protected
  List<FormValidatorAnnotation> getValidators(
    ModelForm modelItem,
    String property,
  ) {
    if (modelItem == null)
      throw new Exception('Cannot get validators from a null model element.');

    InstanceMirror instanceMirror = this.getInstanceMirror(modelItem);
    VariableMirror variableMirror =
        instanceMirror.type.declarations[property] as VariableMirror;

    if (variableMirror == null) return new List<FormValidatorAnnotation>();

    List<FormValidatorAnnotation> validators =
        Collection(variableMirror.metadata)
            .where((arg1) => arg1 is FormValidatorAnnotation)
            .select((arg1) => arg1 as FormValidatorAnnotation)
            .orderBy((arg1) => arg1.criticityLevel)
            .toList();
    return validators;
  }
}
