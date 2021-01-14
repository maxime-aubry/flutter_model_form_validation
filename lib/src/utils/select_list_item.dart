import 'dart:ffi';

import 'package:flutter_model_form_validation/src/utils/index.dart';

class SelectListItem<TValue> {
  SelectListItem(
    this.value,
    this.text,
  )   : assert(value != null),
        assert(
            TValue == DateTime ||
                TValue == num ||
                TValue == int ||
                TValue == double ||
                TValue == Uint8 ||
                TValue == Uint16 ||
                TValue == Uint32 ||
                TValue == Uint64 ||
                TValue == Int8 ||
                TValue == Int16 ||
                TValue == Int32 ||
                TValue == Int64 ||
                TValue == String ||
                TValue == bool ||
                isEnum<TValue>(),
            'Cannot instanciate a SelectListItem if its value is not a datetime, a number, a string, a bool or an enum.'),
        assert(text != null),
        assert(text != '');

  TValue value;
  String text;
}
