// import 'package:flutter_model_form_validation/src/annotations/index.dart';
// import 'package:reflectable/reflectable.dart';

// bool isEnum<TProperty>() {
//   try {
//     ClassMirror cm = flutterModelFormValidator.reflectType(TProperty);
//     return cm?.isEnum ?? false;
//   } catch (_) {
//     return false;
//   }
// }

// bool isListOfEnum<TProperty>(String libraryName) {
//   try {
//     String listType = TProperty.toString();

//     // does the type name is List<T> ?
//     if (!listType.startsWith('List<') && !listType.endsWith('>')) return false;

//     // get the enum type name
//     final RegExp regexp = RegExp(r'^List<([a-zA-Z]+)>$');
//     Iterable<RegExpMatch> matches = regexp.allMatches(listType);
//     RegExpMatch match = matches.elementAt(0);
//     String enumType = match.group(1);
//     if (enumType.isEmpty || enumType == ' ') return false;

//     // get the library definition
//     LibraryMirror lm = flutterModelFormValidator.findLibrary(libraryName);
//     if (lm == null) return false;

//     // search the type definition
//     // -> is it an enum ?
//     ClassMirror dm = lm.declarations[enumType];
//     return dm?.isEnum ?? false;
//   } catch (_) {
//     return false;
//   }
// }

// bool isListOfType<TProperty, TList>() {
//   List<TList> items = [];
//   String listType = items.runtimeType.toString();
//   String propertyType = TProperty.toString();
//   bool result = (propertyType == listType);
//   return result;
// }
