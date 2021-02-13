import 'package:flutter/foundation.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class InText extends FormControlValidatorAnnotation<String> {
  const InText({
    this.text,
    this.textOnProperty,
    @required String error,
  }) : super(error: error);

  /// [text] is the text in which user will search keywords.
  final String text;

  /// [textOnProperty] is the name of targeted property in which user will search keywords. This one has priority on [text] value.
  final String textOnProperty;

  @override
  Future<bool> isValid(FormControl<String> control) async {
    String text = super.getValidatorParameter<String>(
      control,
      this.textOnProperty,
      this.text,
    );
    bool isValid = this._validate(control.value, text);
    return isValid;
  }

  bool _validate(String value, String text) {
    if (value == null || value.isEmpty) return true;
    if (text == null || text.isEmpty) return true;
    return text.contains(value);
  }
}
