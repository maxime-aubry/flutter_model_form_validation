import 'package:flutter_test/flutter_test.dart';

import 'stubs/in_text.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > InText.', () {
    group('Valid.', () {
      test('value is in text.', () async {
        InText_ValueIsInText_Stub stub = new InText_ValueIsInText_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and text are null.', () async {
        InText_ValueAndTextAreNull_Stub stub =
            new InText_ValueAndTextAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is null.', () async {
        InText_ValueIsNull_Stub stub = new InText_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is null.', () async {
        InText_ValueToCompareIsNull_Stub stub =
            new InText_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value is not in text.', () async {
        InText_ValueIsNotInText_Stub stub = new InText_ValueIsNotInText_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote text is provided.', () async {
        InText_RemoteTextIsProvided_Stub stub =
            new InText_RemoteTextIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
