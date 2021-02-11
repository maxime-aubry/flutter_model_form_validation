import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/form_control/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';
import 'package:mime/mime.dart';

class FileMimeType extends FormControlValidatorAnnotation<Uint8List> {
  const FileMimeType({
    @required this.mimeTypes,
    @required String error,
  }) : super(error: error);

  /// [mimeTypes] is the allowed mime types list.
  final List<String> mimeTypes;

  @override
  Future<bool> isValid(FormControl<Uint8List> control) async =>
      this._validate(control.value);

  bool _validate(Uint8List value) {
    if (value == null) return true;
    String mimeType = lookupMimeType('no-file', headerBytes: value);
    if (this.mimeTypes.contains(mimeType)) return true;
    return false;
  }
}
