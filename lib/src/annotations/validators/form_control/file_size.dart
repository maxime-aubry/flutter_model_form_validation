import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/form_control/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

class FileSize extends FormControlValidatorAnnotation<Uint8List> {
  const FileSize({
    @required this.size,
    @required String error,
  }) : super(error: error);

  /// [size] is the allowed size.
  final int size;

  @override
  Future<bool> isValid(FormControl<Uint8List> control) async {
    if (this.size == null)
      throw new ValidationException('File size is not defined.');
    bool isValid = await this._validate(control.value);
    return isValid;
  }

  bool _validate(Uint8List value) {
    if (value == null) return true;
    if (value.length <= this.size) return true;
    return false;
  }
}
