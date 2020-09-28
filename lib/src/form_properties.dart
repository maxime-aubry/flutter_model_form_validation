import 'package:flutter_model_form_validation/src/form_property.dart';
import 'package:reflectable/reflectable.dart';

class FormProperties {
  static List<FormProperty> getProperties<TModel>(
      TModel model, ClassMirror classMirror) {
    List<FormProperty> properties = new List<FormProperty>();
    for (MapEntry<String, DeclarationMirror> item
        in classMirror.declarations.entries)
      if (item.value is VariableMirror)
        properties.add(
          FormProperty.init<TModel>(model, item.value as VariableMirror),
        );
    return properties;
  }
}
