import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../stubs.dart';

class _InTextStub extends ValidatorStub<FormControl<String>, InText> {
  _InTextStub({
    String value,
    String remoteText,
    String remoteTextName,
    String localText,
  }) : super() {
    FormControl<String> _value = new FormControl<String>(
      value: value,
      validators: [],
    );
    FormControl<String> _text = new FormControl<String>(
      value: remoteText,
      validators: [],
    );

    Map<String, AbstractControl> controls = {'value': _value};
    if (remoteTextName != null) controls[remoteTextName] = _text;

    FormGroup _root = new FormGroup(
      controls: controls,
      validators: [],
    );

    _value.parentGroup = _root;
    _text.parentGroup = _root;

    super.control = _value;
    super.validator = InText(
      text: localText,
      remoteText: remoteTextName,
      error: null,
    );
  }
}

/* Value is valid */
class InText_ValueIsInText_Stub extends _InTextStub {
  InText_ValueIsInText_Stub()
      : super(
          value: 'consectetur',
          localText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        );
}

class InText_ValueAndTextAreNull_Stub extends _InTextStub {
  InText_ValueAndTextAreNull_Stub()
      : super(
          value: null,
          localText: null,
        );
}

/* Value is not valid */
class InText_ValueIsNull_Stub extends _InTextStub {
  InText_ValueIsNull_Stub()
      : super(
          value: null,
          localText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        );
}

class InText_ValueToCompareIsNull_Stub extends _InTextStub {
  InText_ValueToCompareIsNull_Stub()
      : super(
          value: 'consectetur',
          localText: null,
        );
}

class InText_ValueIsNotInText_Stub extends _InTextStub {
  InText_ValueIsNotInText_Stub()
      : super(
          value: 'azerty',
          localText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        );
}

/* Remote parameters are provided */
class InText_TextOnPropertyIsProvided_Stub extends _InTextStub {
  InText_TextOnPropertyIsProvided_Stub()
      : super(
          value: 'exercitation',
          remoteText:
              'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          remoteTextName: 'text',
          localText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        );
}

/* Exceptions on parameters */
