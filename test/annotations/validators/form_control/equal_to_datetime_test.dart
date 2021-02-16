import 'package:flutter_test/flutter_test.dart';

import 'stubs/equal_to_datetime.dart';

void main() {
  group('Annotations > Validators > EqualToDateTime.', () {
    group('Valid.', () {
      test('Value is a valid email.', () async {
        EqualToDateTime_ValueEqualsValueToCompare_Stub stub =
            new EqualToDateTime_ValueEqualsValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('Value is null.', () async {
        EqualToDateTime_ValueIsNull_Stub stub =
            new EqualToDateTime_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('Value does not equal to valueToCompare.', () async {
        EqualToDateTime_ValueDoesNotEqualValueToCompare_Stub stub =
            new EqualToDateTime_ValueDoesNotEqualValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test(
          'valueToCompareOnProperty is provided. Its value override the one of valueToCompare.',
          () async {
        EqualToDateTime_ValueToCompareOnPropertyIsProvided_Stub stub =
            new EqualToDateTime_ValueToCompareOnPropertyIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Throws exception on parameters.', () {
      test(
          'valueToCompareOnProperty is provided. Its value override the one of valueToCompare.',
          () async {
        EqualToDateTime_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub
            stub =
            new EqualToDateTime_ThrowsValidatorParameterExceptionOnNullValueToCompare_Stub();
        expect<(actual, matcher)
      });
    });
  });
}
