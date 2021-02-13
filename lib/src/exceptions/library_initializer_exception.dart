import 'package:flutter_model_form_validation/src/exceptions/index.dart';

class LibraryInitializerException implements IException {
  LibraryInitializerException(this.message);

  @override
  String message;
}