import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stubs/email.dart';

void main() {
  setUp(() {
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('RangeOfDateTime.', () {
    test('Email validator returns True (value: \'a.a@a.a\').', () async {
      EmailValidStub stub = new EmailValidStub();
      FormControl<String> formControl = stub.getControl();
      Email validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('Email validator returns True (value: null).', () async {
      EmailNullStub stub = new EmailNullStub();
      FormControl<String> formControl = stub.getControl();
      Email validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('Email validator returns True (value: \'\').', () async {
      EmailEmptyStub stub = new EmailEmptyStub();
      FormControl<String> formControl = stub.getControl();
      Email validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });

    test('Email validator returns False (value: \'a.a@a\').', () async {
      EmailEmptyStub stub = new EmailEmptyStub();
      FormControl<String> formControl = stub.getControl();
      Email validator = stub.getValidator();
      bool isValid = await validator.isValid(formControl);
      expect(isValid, isTrue);
    });
  });
}
