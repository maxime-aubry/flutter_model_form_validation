import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:reflectable/mirrors.dart';

class FormControlFilter {
  static String libraryName;

  static bool isAllowedFormControlType<TProperty>() {
    bool isAllowedType = (TProperty == DateTime ||
        TProperty == num ||
        TProperty == int ||
        TProperty == double ||
        TProperty == Uint8 ||
        TProperty == Uint16 ||
        TProperty == Uint32 ||
        TProperty == Uint64 ||
        TProperty == Int8 ||
        TProperty == Int16 ||
        TProperty == Int32 ||
        TProperty == Int64 ||
        TProperty == String ||
        TProperty == bool ||
        _isEnum<TProperty>() ||
        // allowed lists of type
        _isListOfType<TProperty, DateTime>() ||
        _isListOfType<TProperty, num>() ||
        _isListOfType<TProperty, int>() ||
        _isListOfType<TProperty, double>() ||
        TProperty == Uint8List ||
        TProperty == Uint16List ||
        TProperty == Uint32List ||
        TProperty == Uint64List ||
        TProperty == Int8List ||
        TProperty == Int16List ||
        TProperty == Int32List ||
        TProperty == Int64List ||
        _isListOfType<TProperty, String>() ||
        _isListOfType<TProperty, bool>() ||
        _isListOfEnum<TProperty>());
    return isAllowedType;
  }
}

bool _isEnum<TProperty>() {
  try {
    ClassMirror classMirror = flutterModelFormValidator.reflectType(TProperty);
    return classMirror?.isEnum ?? false;
  } catch (_) {
    return false;
  }
}

bool _isListOfEnum<TProperty>() {
  if (FormControlFilter.libraryName == null ||
      FormControlFilter.libraryName.isEmpty)
    throw new FormControlFilterException(
        'Library name is required to detect enums.');

  String seekedType = TProperty.toString();
  if (!_isList(seekedType)) return false;
  String enumType = _getEnumStringType(seekedType);
  bool isEnum = _isSeekedTypeAnEnum(enumType);
  return isEnum;
}

bool _isListOfType<TProperty, TList>() {
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

bool _isSeekedTypeAnEnum(String enumType) {
  try {
    LibraryMirror libraryMirror =
        flutterModelFormValidator.findLibrary(FormControlFilter.libraryName);
    if (libraryMirror == null) return false;
    ClassMirror classMirror = libraryMirror.declarations[enumType];
    return classMirror?.isEnum ?? false;
  } catch (_) {
    return false;
  }
}
