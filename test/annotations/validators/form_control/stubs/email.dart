import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../main_stub.dart';

abstract class _IEmailStub extends IStub<FormControl<String>, Email> {}

class EmailValidStub extends _IEmailStub {
  @override
  FormControl<String> getControl() {
    FormControl<String> value = new FormControl<String>(
      value: 'a.a@a.a',
      validators: [],
    );
    return value;
  }

  @override
  Email getValidator() => Email(error: 'invalid email');
}

class EmailNullStub extends _IEmailStub {
  @override
  FormControl<String> getControl() {
    FormControl<String> value = new FormControl<String>(
      value: null,
      validators: [],
    );
    return value;
  }

  @override
  Email getValidator() => Email(error: 'invalid email');
}

class EmailEmptyStub extends _IEmailStub {
  @override
  FormControl<String> getControl() {
    FormControl<String> value = new FormControl<String>(
      value: '',
      validators: [],
    );
    return value;
  }

  @override
  Email getValidator() => Email(error: 'invalid email');
}

class EmailInvalidStub extends _IEmailStub {
  @override
  FormControl<String> getControl() {
    FormControl<String> value = new FormControl<String>(
      value: 'a.a@a',
      validators: [],
    );
    return value;
  }

  @override
  Email getValidator() => Email(error: 'invalid email');
}
