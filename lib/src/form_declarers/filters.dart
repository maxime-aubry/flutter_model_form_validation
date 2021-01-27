import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:reflectable/mirrors.dart';

bool isEnum<TProperty>() {
  try {
    ClassMirror classMirror = flutterModelFormValidator.reflectType(TProperty);
    return classMirror?.isEnum ?? false;
  } catch (_) {
    return false;
  }
}

bool isListOfEnum<TProperty>(String libraryName) {
  String seekedType = TProperty.toString();
  if (!_isList(seekedType)) return false;
  String enumType = _getEnumStringType(seekedType);
  bool isEnum = _isSeekedTypeAnEnum(libraryName, enumType);
  return isEnum;
}

bool isListOfType<TProperty, TList>() {
  try {
    String seekedType = (<TList>[]).runtimeType.toString();
    String wantedType = TProperty.toString();
    bool isListOfType = (wantedType == seekedType);
    return isListOfType;
  } catch (_) {
    return false;
  }
}

bool _isList(String seekedType) =>
    (seekedType.startsWith('List<') && seekedType.endsWith('>'));

String _getEnumStringType(String seekedType) {
  final RegExp regexp = RegExp(r'^List<([a-zA-Z]+)>$');
  Iterable<RegExpMatch> matches = regexp.allMatches(seekedType);
  RegExpMatch match = matches.elementAt(0);
  String enumType = match.group(1);
  if (enumType.isEmpty || enumType == ' ') throw new Exception();
  return enumType;
}

bool _isSeekedTypeAnEnum(String libraryName, String enumType) {
  try {
    LibraryMirror libraryMirror =
        flutterModelFormValidator.findLibrary(libraryName);
    if (libraryMirror == null) return false;
    ClassMirror classMirror = libraryMirror.declarations[enumType];
    return classMirror?.isEnum ?? false;
  } catch (_) {
    return false;
  }
}
