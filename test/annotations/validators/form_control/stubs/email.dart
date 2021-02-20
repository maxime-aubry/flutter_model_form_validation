import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stubs.dart';

class _EmailStub extends ValidatorStub<FormControl<String>, Email> {
  _EmailStub({
    String value,
  }) {
    super.control = new FormControl<String>(
      value: value,
      validators: [],
    );
    super.validator = Email(error: null);
  }
}

/* Value is valid */
class Email_ValidEmail_Stub extends _EmailStub {
  Email_ValidEmail_Stub() : super(value: 'a.a@a.a');
}

class Email_ValueIsNull_Stub extends _EmailStub {
  Email_ValueIsNull_Stub() : super(value: null);
}

class Email_EmptyValue_Stub extends _EmailStub {
  Email_EmptyValue_Stub() : super(value: '');
}

/* Value is not valid */
class Email_InavlidEmail_Stub extends _EmailStub {
  Email_InavlidEmail_Stub() : super(value: 'a.a@a');
}

/* Remote parameters are provided */

/* Exceptions */
