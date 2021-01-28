import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter_model_form_validation/src/form_declarers/index.dart';

class FormControlElement<TProperty> extends FormElementNotifier<TProperty> {
  FormControlElement(TProperty value, String libraryName)
      : assert(libraryName != null && libraryName.isNotEmpty,
            'Library name must be provided.'),
        // assert(TProperty != ModelForm,
        //     'Cannot instanciate a form control element with a ModelForm value.'),
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
                isEnum<TProperty>() ||
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
                isListOfType<TProperty, bool>() ||
                isListOfEnum<TProperty>(libraryName),
            'Cannot instanciate a FormControlElement with a not allowed type. Allowed types are : DateTime, num, int, double, Uint8, Uint16, Uint32, Uint64, Int8, Int16, Int32, Int64, String, bool, enums, List<DateTime>, List<num>, List<int>, List<double>, Uint8List, Uint16List, Uint32List, Uint64List, Int8List, Int16List, Int32List, Int64List, List<String>, List<bool> and a list of enum.'),
        super(value);

  TProperty get value => super.value;

  @override
  set value(TProperty value) {
    super.value = value;
  }
}
