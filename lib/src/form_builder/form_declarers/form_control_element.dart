import 'dart:ffi';
import 'dart:typed_data';

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
                TProperty == Uint8 ||
                TProperty == Uint16 ||
                TProperty == Uint32 ||
                TProperty == Uint64 ||
                TProperty == Int8 ||
                TProperty == Int16 ||
                TProperty == Int32 ||
                TProperty == Int64 ||
                TProperty == String ||
                TProperty == bool ||
                // allowed lists of type
                isListOfType<TProperty, DateTime>() ||
                isListOfType<TProperty, num>() ||
                isListOfType<TProperty, int>() ||
                isListOfType<TProperty, double>() ||
                TProperty == Uint8List ||
                TProperty == Uint16List ||
                TProperty == Uint32List ||
                TProperty == Uint64List ||
                TProperty == Int8List ||
                TProperty == Int16List ||
                TProperty == Int32List ||
                TProperty == Int64List ||
                isListOfType<TProperty, String>() ||
                isListOfType<TProperty, bool>(),
            'Cannot instanciate a form control element if its value is not a datetime, a number, a string or a bool.'),
        super(value);

  TProperty get value => super.value;

  @override
  set value(TProperty value) {
    super.value = value;
  }
}

bool isListOfType<TProperty, TList>() {
  String listType = (new List<TList>()).runtimeType.toString();
  String propertyType = TProperty.toString();
  bool result = (propertyType == listType);
  return result;
}
