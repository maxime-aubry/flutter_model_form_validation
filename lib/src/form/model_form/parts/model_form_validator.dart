// // import 'package:flutter/foundation.dart';
// // import 'package:flutter_model_form_validation/src/annotations/index.dart';
// // import 'package:flutter_model_form_validation/src/form/model_form/index.dart';
// // import 'package:queries/collections.dart';
// // import 'package:reflectable/reflectable.dart';

// // mixin ModelFormValidator<TModel extends ModelForm> {
// //   /* Public properties */

// //   /* Protected properties */

// //   /* Private properties */

// //   /* Getters */

// //   /* Setters */

// //   /* Constructors */

// //   /* Public methods */

// //   /* Protected methods */

// //   /* Private methods */

// //   @protected
// //   InstanceMirror getInstanceMirror(Object value) {
// //     InstanceMirror instanceMirror = flutterModelFormValidator.reflect(value);
// //     return instanceMirror;
// //   }

// //   @protected
// //   TFormElement getModelPart<TFormElement extends FormElementNotifier>(
// //     ModelForm model,
// //     String property,
// //   ) {
// //     assert(
// //         TFormElement == FormGroupElement ||
// //             TFormElement == FormArrayElement ||
// //             TFormElement == FormControlElement,
// //         'Cannot get a model part that is not an object of type FormGroupElement, FormArrayElement, FormControlElement or FormControllistElement. Application crashed because of model of type ${model.runtimeType} and property nammed $property.');

// //     InstanceMirror instanceMirror = this.getInstanceMirror(model);
// //     Object formElement = instanceMirror.invokeGetter(property);
// //     if (formElement is! TFormElement)
// //       throw new Exception(
// //           'Cannot get a model part of $TFormElement type. Application crashed because of model of type ${model.runtimeType} and property nammed $property.');
// //     return formElement as TFormElement;
// //   }

// //   @protected
// //   List<FormValidatorAnnotation> getValidators(
// //     ModelFormGroup parentGroup,
// //     String property,
// //   ) {
// //     InstanceMirror instanceMirror = this.getInstanceMirror(parentGroup.current);
// //     VariableMirror variableMirror =
// //         instanceMirror.type.declarations[property] as VariableMirror;

// //     if (variableMirror == null) return [];

// //     List<FormValidatorAnnotation> validators =
// //         Collection(variableMirror.metadata)
// //             .where((arg1) => arg1 is FormValidatorAnnotation)
// //             .select((arg1) => arg1 as FormValidatorAnnotation)
// //             .toList();
// //     return validators;
// //   }
// // }
