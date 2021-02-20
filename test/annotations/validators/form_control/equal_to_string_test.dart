import 'package:flutter_test/flutter_test.dart';

import 'stubs/equal_to_string.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > EqualToString.',
      () {
    group('Valid.', () {
      test('value equals valueToCompare.', () async {
        EqualToString_ValueEqualsValueToCompare_Stub stub =
            new EqualToString_ValueEqualsValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        EqualToString_ValueAndValueToCompareAreNull_Stub stub =
            new EqualToString_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is null.', () async {
        EqualToString_ValueIsNull_Stub stub =
            new EqualToString_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('valueToCompare is null.', () async {
        EqualToString_ValueToCompareIsNull_Stub stub =
            new EqualToString_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value does not equal valueToCompare.', () async {
        EqualToString_ValueDoesNotEqualValueToCompare_Stub stub =
            new EqualToString_ValueDoesNotEqualValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remot valueToCompare is provided.', () async {
        EqualToString_remoteValueToCompareIsProvided_Stub stub =
            new EqualToString_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
