import 'package:flutter_model_form_validation/src/form_builder/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class FormArrayElement<TProperty extends ModelForm>
    extends FormElementNotifier<List<TProperty>> {
  FormArrayElement(List<TProperty> values) : super(values);

  List<TProperty> get value => super.value;

  set value(List<TProperty> values) {
    super.value = values;
  }
}
