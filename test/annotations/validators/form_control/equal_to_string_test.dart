import 'package:flutter_test/flutter_test.dart';

import 'stubs/equal_to_string.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > EqualToString.',
      () {
    group('Valid.', () {
      test('value equals valueToCompare.', () async {
        EqualToString_ValueIsEqualToValueToCompare_Stub stub =
            new EqualToString_ValueIsEqualToValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value and valueToCompare are null.', () async {
        EqualToString_ValueAndValueToCompareAreNull_Stub stub =
            new EqualToString_ValueAndValueToCompareAreNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        EqualToString_ValueIsNull_Stub stub =
            new EqualToString_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('valueToCompare is null.', () async {
        EqualToString_ValueToCompareIsNull_Stub stub =
            new EqualToString_ValueToCompareIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('value is smaller than valueToCompare.', () async {
        EqualToString_ValueIsSmallerThanValueToCompare_Stub stub =
            new EqualToString_ValueIsSmallerThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('value is greater than valueToCompare.', () async {
        EqualToString_ValueIsGreaterThanValueToCompare_Stub stub =
            new EqualToString_ValueIsGreaterThanValueToCompare_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        EqualToString_remoteValueToCompareIsProvided_Stub stub =
            new EqualToString_remoteValueToCompareIsProvided_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });
  });
}
