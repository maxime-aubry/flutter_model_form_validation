class SelectListItem<TValue extends Comparable> {
  SelectListItem(this.value, this.text, [this.isSelected = false])
      : assert(value != null),
        assert(value is DateTime || value is num || value is String),
        assert(text != null),
        assert(text != '');

  TValue value;
  String text;
  bool isSelected;
}
