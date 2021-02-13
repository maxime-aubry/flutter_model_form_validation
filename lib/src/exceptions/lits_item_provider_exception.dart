import 'package:flutter_model_form_validation/src/exceptions/index.dart';

class ListItemProviderException implements IException {
  ListItemProviderException(this.message);

  @override
  String message;
}