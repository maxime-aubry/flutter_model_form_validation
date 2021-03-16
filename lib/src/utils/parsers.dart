import 'package:queries/collections.dart';

extension DateTimeParsing on String {
  DateTime toDateTime() {
    if (this == null) return null;
    return DateTime.tryParse(this) ?? null;
  }

  num toNumber() {
    if (this == null) return null;
    return num.tryParse(this) ?? null;
  }
}

// extension ListStringParsing on List<String> {
//   List<DateTime> toDateTimeList() {
//     if (this == null) return null;
//     List<DateTime> values =
//         Collection(this).select((arg1) => arg1.toDateTime()).toList();
//     return values ?? null;
//   }

//   List<num> toNumberList() {
//     if (this == null) return null;
//     List<num> values =
//         Collection(this).select((arg1) => arg1.toNumber()).toList();
//     return values ?? null;
//   }
// }
