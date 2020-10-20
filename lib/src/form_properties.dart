import 'package:flutter_model_form_validation/src/form_property.dart';
import 'package:reflectable/reflectable.dart';

class FormProperties {
  /// Returns a list of properties for the current model.
  List<FormProperty> getProperties<TModel>(
      TModel model, ClassMirror classMirror) {
    List<FormProperty> properties = new List<FormProperty>();
    for (MapEntry<String, DeclarationMirror> item
        in classMirror.declarations.entries)
      if (item.value is MethodMirror && !item.value.simpleName.endsWith('='))
        properties.add(
          new FormProperty(model, item.value as MethodMirror),
        );
    return properties;
  }
}
