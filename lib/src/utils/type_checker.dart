import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:reflectable/reflectable.dart';

bool isEnum<TProperty>() {
  try {
    ClassMirror cm = flutterModelFormValidator.reflectType(TProperty);
    if (cm == null) return false;
    return cm.isEnum;
  } catch (_) {
    return false;
  }
}

bool isListOfEnum<TProperty>() {
  try {
    String listType = TProperty.toString();

    if (!listType.startsWith('List<')) return false;

    final RegExp regexp = RegExp(r'^List<([a-zA-Z]+)>$');
    Iterable<RegExpMatch> matches = regexp.allMatches(listType);
    RegExpMatch match = matches.elementAt(0);

    String enumType = match.group(1);

    if (enumType.isEmpty || enumType == ' ') return false;

    LibraryMirror lm = flutterModelFormValidator.findLibrary('example.models');

    if (lm == null) return false;

    ClassMirror dm = lm.declarations[enumType];

    if (dm == null) return false;

    return dm.isEnum;
  } catch (_) {
    return false;
  }
}

bool isListOfType<TProperty, TList>() {
  List<TList> items = [];
  String listType = items.runtimeType.toString();
  String propertyType = TProperty.toString();
  bool result = (propertyType == listType);
  return result;
}
