extension DateTimeParsing on String {
  DateTime toDateTime() {
    return DateTime.tryParse(this) ?? null;
  }
}
