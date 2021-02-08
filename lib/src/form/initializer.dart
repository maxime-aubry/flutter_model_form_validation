import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';

class LibraryInitializer {
  static bool _isInitialized = false;
  static String _libraryName;

  static get isInitialized => LibraryInitializer._isInitialized;
  static get libraryName => LibraryInitializer._libraryName;

  static void initialize({
    @required String libraryName,
  }) {
    if (libraryName == null || libraryName.isEmpty)
      throw new LibraryInitializerException(
          'Library name is required for the library initializer. This one provides a way to detect and allow enums.');

    _libraryName = libraryName;
    _isInitialized = true;
  }
}
