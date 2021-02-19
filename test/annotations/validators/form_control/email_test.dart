import 'package:flutter_test/flutter_test.dart';

import 'stubs/email.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > Email.', () {
    group('Valid.', () {
      test('value is a valid email.', () async {
        Email_ValidEmail_Stub stub = new Email_ValidEmail_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        Email_ValueIsNull_Stub stub = new Email_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is empty.', () async {
        Email_EmptyValue_Stub stub = new Email_EmptyValue_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is not a valid email.', () async {
        Email_InavlidEmail_Stub stub = new Email_InavlidEmail_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });
  });
}
