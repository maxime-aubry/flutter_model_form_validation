extension DateTimeParsing on String {
  DateTime toDateTime() {
    if (this == null) return null;
    return DateTime.tryParse(this) ?? null;
  }
}
