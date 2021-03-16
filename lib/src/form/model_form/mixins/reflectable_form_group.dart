// import 'package:flutter/foundation.dart';
// import 'package:flutter_model_form_validation/src/form/index.dart';
// import 'package:reflectable/reflectable.dart';

// mixin ReflectableFormGroup {
//   /* Public properties */

//   /* Protected properties */

//   /* Private properties */

//   /* Getters */

//   /* Setters */

//   /* Constructors */

//   /* Public methods */

//   /* Protected methods */
//   @protected
//   Iterable<MapEntry<String, FormElementNotifier>> getControls(
//       ModelForm model, InstanceMirror instanceMirror) {
//     Iterable<MapEntry<String, FormElementNotifier>> formElements =
//         instanceMirror.type.declarations.entries
//             .where((element) => element.value is VariableMirror)
//             .cast<MapEntry<String, VariableMirror>>()
//             .where((element) =>
//                 element.value.dynamicReflectedType == FormElementNotifier)
//             .cast<MapEntry<String, FormElementNotifier>>()
//             .toList();
//     return formElements;
//   }

//   /* Private methods */
// }
