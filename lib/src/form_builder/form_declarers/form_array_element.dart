import 'package:collection/collection.dart';
import 'package:flutter_model_form_validation/src/form_builder/form_declarers/index.dart';
import 'package:flutter_model_form_validation/src/index.dart';

class FormArrayElement<TProperty extends ModelForm>
    extends FormElementNotifier<FormArratItems<TProperty>> {
  FormArrayElement(List<TProperty> values)
      : super(new FormArratItems<TProperty>(values ?? [])) {
    // when updating the list, listeners will lbe triggered
    super.value.onChange = () {
      super.notifyListeners();
    };
  }

  FormArratItems<TProperty> get value => super.value;

  set value(List<TProperty> values) {
    super.value.clear();
    for (TProperty item in values) super.value.add(item);
  }
}

class FormArratItems<TProperty> extends DelegatingList<TProperty> {
  FormArratItems(List<TProperty> base) : super(base);

  Function onChange;

  @override
  void add(TProperty value) {
    super.add(value);
    this.onChange();
  }

  @override
  void addAll(Iterable<TProperty> iterable) {
    super.addAll(iterable);
    this.onChange();
  }

  @override
  void clear() {
    super.clear();
    this.onChange();
  }

  @override
  void fillRange(int start, int end, [TProperty fillValue]) {
    super.fillRange(start, end, fillValue);
    this.onChange();
  }

  @override
  void insert(int index, TProperty element) {
    super.insert(index, element);
    this.onChange();
  }

  @override
  void insertAll(int index, Iterable<TProperty> iterable) {
    super.insertAll(index, iterable);
    this.onChange();
  }

  @override
  bool remove(Object value) {
    bool result = super.remove(value);
    this.onChange();

    return result;
  }

  @override
  TProperty removeAt(int index) {
    TProperty result = super.removeAt(index);
    this.onChange();

    return result;
  }

  @override
  TProperty removeLast() {
    TProperty result = super.removeLast();
    this.onChange();

    return result;
  }

  @override
  void removeRange(int start, int end) {
    super.removeRange(start, end);
    this.onChange();
  }

  @override
  void removeWhere(bool Function(TProperty) test) {
    super.removeWhere(test);
    this.onChange();
  }

  @override
  void replaceRange(int start, int end, Iterable<TProperty> iterable) {
    super.replaceRange(start, end, iterable);
    this.onChange();
  }

  @override
  void retainWhere(bool Function(TProperty) test) {
    super.retainWhere(test);
    this.onChange();
  }

  @override
  void setAll(int index, Iterable<TProperty> iterable) {
    super.setAll(index, iterable);
    this.onChange();
  }

  @override
  void setRange(
    int start,
    int end,
    Iterable<TProperty> iterable, [
    int skipCount = 0,
  ]) {
    super.setRange(start, end, iterable, skipCount);
    this.onChange();
  }
}
