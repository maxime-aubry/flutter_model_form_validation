import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

import '../../stub.dart';

class _InTextStub extends IStub<FormControl<String>, InText> {
  _InTextStub({
    String fcValue,
    String fcText,
    String validatorText,
  }) : super() {
    FormControl<String> _value = new FormControl<String>(
      value: fcValue,
      validators: [],
    );
    FormControl<String> _text = new FormControl<String>(
      value: fcText,
      validators: [],
    );
    FormGroup _root = new FormGroup(
      controls: {
        'value': _value,
        'text': _text,
      },
      validators: [],
    );
    _value.parentGroup = _root;
    _text.parentGroup = _root;

    super.control = _value;
    super.validator = InText(
      text: validatorText,
      remoteText: (fcText != null) ? 'text' : null,
      error: 'value not in text',
    );
  }
}

/* Value is valid */
class InText_ValueIsInText_Stub extends _InTextStub {
  InText_ValueIsInText_Stub()
      : super(
          fcValue: 'consectetur',
          validatorText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        );
}

class InText_ValueIsNull_Stub extends _InTextStub {
  InText_ValueIsNull_Stub()
      : super(
          fcValue: null,
          validatorText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        );
}

class InText_ValueIsEmpty_Stub extends _InTextStub {
  InText_ValueIsEmpty_Stub()
      : super(
          fcValue: '',
          validatorText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        );
}

/* Value is not valid */
class InText_ValueIsNotInText_Stub extends _InTextStub {
  InText_ValueIsNotInText_Stub()
      : super(
          fcValue: 'azerty',
          validatorText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        );
}

/* Remote parameters are provided */
class InText_TextOnPropertyIsProvided_Stub extends _InTextStub {
  InText_TextOnPropertyIsProvided_Stub()
      : super(
          fcValue: 'exercitation',
          validatorText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          fcText:
              'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        );
}

/* Exceptions on parameters */
class ImageSize_ThrowsValidatorParameterExceptionOnNullText_Stub
    extends _InTextStub {
  ImageSize_ThrowsValidatorParameterExceptionOnNullText_Stub()
      : super(
          fcValue: 'consectetur',
          validatorText: null,
          fcText: null,
        );
}
