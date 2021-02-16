import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation/src/annotations/validators/form_control/index.dart';
import 'package:flutter_model_form_validation/src/form/reactive_form/index.dart';

/// [FileSize] is a validator that check if a file has an allowed size.
class FileSize extends FormControlValidatorAnnotation<Uint8List> {
  const FileSize({
    @required this.size,
    @required String error,
  }) : super(error: error);

  /// [size] is the allowed size. It's a constant, provided by developer inside the [FileSize] annotation.
  final int size;

  /// Check [FormControl] value (a byte array) to confirm if this one has a valid size.
  ///
  /// Returns a Future<bool>. The validator will check if FormControl's file has an allowed mime type. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] of [Uint8List] type here.
  @override
  Future<bool> isValid(FormControl<Uint8List> control) async {
    if (this.size == null)
      throw new ValidatorParameterException('File size is not defined.');
    bool isValid = await this._validate(control.value);
    return isValid;
  }

  bool _validate(Uint8List value) {
    if (value == null) return true;
    if (value.length <= this.size) return true;
    return false;
  }
}
