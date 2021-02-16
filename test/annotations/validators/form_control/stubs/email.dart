import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _EmailStub extends IStub<FormControl<String>, Email> {
  _EmailStub({
    String fcValue,
  }) {
    super.control = new FormControl<String>(
      value: fcValue,
      validators: [],
    );
    super.validator = Email(error: 'invalid email');
  }
}

/* Value is valid */
class Email_ValidEmail_Stub extends _EmailStub {
  Email_ValidEmail_Stub() : super(fcValue: 'a.a@a.a');
}

class Email_ValueIsNull_Stub extends _EmailStub {
  Email_ValueIsNull_Stub() : super(fcValue: null);
}

class Email_EmptyValue_Stub extends _EmailStub {
  Email_EmptyValue_Stub() : super(fcValue: '');
}

/* Value is not valid */
class Email_InavlidEmail_Stub extends _EmailStub {
  Email_InavlidEmail_Stub() : super(fcValue: 'a.a@a');
}

/* Remote parameters are provided */

/* Exceptions on parameters */
