import 'package:flutter_model_form_validation/src/form_builder/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class FormControlElement<TProperty> extends FormElementNotifier<TProperty> {
  FormControlElement(TProperty value)
      : assert(TProperty != ModelForm,
            'Cannot instanciate a form control element with a ModelForm value.'),
        assert(
            TProperty == DateTime ||
                TProperty == num ||
                TProperty == int ||
                TProperty == double ||
                TProperty == String ||
                TProperty == bool,
            'Cannot instanciate a form control element if its value is not a datetime, number or a string.'),
        super(value);

  TProperty get value => super.value;

  @override
  set value(TProperty value) {
    super.value = value;
  }
}

class FormControlListElement<TProperty>
    extends FormElementNotifier<List<TProperty>> {
  FormControlListElement(List<TProperty> values)
      : assert(TProperty != ModelForm,
            'Cannot instanciate a form control element with a ModelForm value.'),
        assert(
            TProperty == DateTime ||
                TProperty == num ||
                TProperty == int ||
                TProperty == double ||
                TProperty == String ||
                TProperty == bool,
            'Cannot instanciate a form control element if its value is not a datetime, a number, a string or a boolean.'),
        super(values);

  List<TProperty> get value => super.value;

  set value(List<TProperty> values) {
    super.value = values;
  }
}
