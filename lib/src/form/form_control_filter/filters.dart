import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/form_control_filter/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';
import 'package:reflectable/reflectable.dart';

class CheckPrimitives<TProperty> implements ICheckFilter {
  @override
  bool checkFilter() => (TProperty == DateTime ||
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
      TProperty == Uint8List ||
      TProperty == Uint16List ||
      TProperty == Uint32List ||
      TProperty == Uint64List ||
      TProperty == Int8List ||
      TProperty == Int16List ||
      TProperty == Int32List ||
      TProperty == Int64List);
}

class CheckListOfPrimitive<TProperty, TList> implements ICheckFilter {
  @override
  bool checkFilter() {
    try {
      String seekedType = (<TList>[]).runtimeType.toString();
      String wantedType = TProperty.toString();
      bool isListOfType = (wantedType == seekedType);
      return isListOfType;
    } catch (_) {
      return false;
    }
  }
}

class CheckEnum<TProperty> implements ICheckFilter {
  @override
  bool checkFilter() {
    try {
      ClassMirror classMirror =
          flutterModelFormValidator.reflectType(TProperty);
      return classMirror?.isEnum ?? false;
    } catch (_) {
      return false;
    }
  }
}

class CheckListOfEnum<TProperty> implements ICheckFilter {
  @override
  bool checkFilter() {
    String seekedType = TProperty.toString();
    if (!this._isList(seekedType)) return false;
    String enumType = this._getEnumStringType(seekedType);
    bool isEnum = this._isSeekedTypeAnEnum(enumType);
    return isEnum;
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
          flutterModelFormValidator.findLibrary(LibraryInitializer.libraryName);
      if (libraryMirror == null) return false;
      ClassMirror classMirror = libraryMirror.declarations[enumType];
      return classMirror?.isEnum ?? false;
    } catch (_) {
      return false;
    }
  }
}
