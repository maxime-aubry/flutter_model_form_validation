import 'package:flutter/widgets.dart';

class SelectListItem<TValue extends Comparable> {
  SelectListItem(this.value, this.text)
      : assert(value != null),
        assert(value is DateTime || value is num || value is String),
        assert(text != null),
        assert(text != '');

  final TValue value;
  final String text;
}
