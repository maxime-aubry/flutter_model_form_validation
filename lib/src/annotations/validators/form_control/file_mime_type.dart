import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/form_control/index.dart';
import 'package:flutter_model_form_validation/src/exceptions/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';
import 'package:mime/mime.dart';

/// [FileMimeType] is a validator that check if a file has an allowed mime type.
class FileMimeType extends FormControlValidatorAnnotation<Uint8List> {
  const FileMimeType({
    @required this.mimeTypes,
    @required String error,
  }) : super(error: error);

  /// [mimeTypes] is the allowed mime types list. It's a constant, provided by developer inside the [FileMimeType] annotation.
  final List<String> mimeTypes;

  /// Check [FormControl] value (a byte array) to confirm if this one has a valid mime type.
  ///
  /// Returns a Future<bool>. The validator will check if FormControl's file has an allowed mime type. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] of [Uint8List] type here.
  @override
  Future<bool> isValid(FormControl<Uint8List> control) async {
    if (this.mimeTypes == null || this.mimeTypes.isEmpty)
      throw new ValidatorParameterException('Mime types are not defined.');
    bool isValid = await this._validate(control.value);
    return isValid;
  }

  bool _validate(Uint8List value) {
    if (value == null) return true;
    String mimeType = lookupMimeType('no-file', headerBytes: value);
    if (this.mimeTypes.contains(mimeType)) return true;
    return false;
  }
}
