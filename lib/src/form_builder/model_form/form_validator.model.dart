import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/index.dart';
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
  Object getSubObject(InstanceMirror instanceMirror, String property) {
    Object child = instanceMirror.invokeGetter(property);
    return child;
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
