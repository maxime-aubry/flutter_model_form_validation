import 'package:flutter_model_form_validation/src/form_builder/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class FormGroupElement<TProperty extends ModelForm>
    extends FormElementNotifier<TProperty> {
  FormGroupElement(TProperty value) : super(value);

  TProperty get value => super.value;

  set value(TProperty value) {
    super.value = value;
  }
}
