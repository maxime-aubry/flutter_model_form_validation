class SelectListItem<TValue> {
  SelectListItem(
    this.value,
    this.text,
  )   : assert(value != null),
        assert(text != null),
        assert(text != '');

  TValue value;
  String text;
}
