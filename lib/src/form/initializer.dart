import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

class LibraryInitializer {
  static bool _isInitialized = false;

  static get isInitialized => LibraryInitializer._isInitialized;

  static void initialize({
    @required String libraryName,
  }) {
    if (libraryName == null || libraryName.isEmpty)
      throw new Exception(
          'Library name is required for the library initializer. This one provides a way to detect and allow enums.');

    FormControlFilter.libraryName = libraryName;
    _isInitialized = true;
  }
}
