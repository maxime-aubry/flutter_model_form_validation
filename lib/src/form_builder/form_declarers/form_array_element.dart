import 'package:collection/collection.dart';
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

class FormArratItems<TProperty> extends DelegatingList<TProperty> {
  FormArratItems(List<TProperty> base) : super(base);

  @override
  void add(TProperty value) {
    super.add(value);
  }

  @override
  void addAll(Iterable<TProperty> iterable) {
    super.addAll(iterable);
  }

  @override
  void clear() {
    super.clear();
  }
}
